# Домашнее задание 16. Сбор и анализ логов

## Задание

Научится проектировать централизованный сбор логов. Рассмотреть особенности разных платформ для сбора логов.

1. В Vagrant разворачиваем 2 виртуальные машины web и log
2. на web настраиваем nginx
3. на log настраиваем центральный лог сервер на любой системе на выбор
- journald;
- rsyslog;
- elk.
4. настраиваем аудит, следящий за изменением конфигов nginx

Все критичные логи с web должны собираться и локально и удаленно. Все логи с nginx должны уходить на удаленный сервер (локально только критичные). Логи аудита должны также уходить на удаленную систему.

# Решение

## Запуск ВМ и ручная настройка

Запускаем 2 ВМ -web и log предварительно закомментировав строки относящиеся к запуску настройки через ansible

`vagrant up`

### Настройка времени

Подключаемся к web и настраиваем часовой пояс

```bash
sudo -i
cp /usr/share/zoneinfo/Asia/Irkutsk /etc/localtime
systemctl restart chronyd

date
Thu Feb 15 14:40:18 +08 2024
```

аналогично настраиваем на ВМ log

### **Установка nginx на виртуальной машине web**

```bash
# Установка репозитария epel
yum install epel-release

# Установка nginx
yum install -y nginx

# Запуск nginx
systemctl restart nginx
systemctl status nginx
● nginx.service - The nginx HTTP and reverse proxy server
   Loaded: loaded (/usr/lib/systemd/system/nginx.service; disabled; vendor preset: disabled)
   Active: active (running) since Thu 2024-02-15 15:05:44 +08; 1s ago
...

ss -tulpan |grep :80
tcp    LISTEN     0      128       *:80                    *:*                   users:(("nginx",pid=3234,fd=6),("nginx",pid=3233,fd=6))
tcp    LISTEN     0      128    [::]:80                 [::]:*                   users:(("nginx",pid=3234,fd=7),("nginx",pid=3233,fd=7))
```

### **Настройка центрального сервера сбора логов на виртуальной машине log**

```bash
yum list rsyslog
Installed Packages
rsyslog.x86_64                                 8.24.0-52.el7                                      @anacondaAvailable Packages
rsyslog.x86_64                                 8.24.0-57.el7_9.3                                  updates
```

Правим /*etc*/rsyslog.conf. Раскомментируем строки 

```bash
# Provides UDP syslog reception
$ModLoad imudp
$UDPServerRun 514

# Provides TCP syslog reception
$ModLoad imtcp
$InputTCPServerRun 514
```

в конец добавляем

```bash
# Add remote logs
$template RemoteLogs,"/var/log/rsyslog/%HOSTNAME%/%PROGRAMNAME%.log"
*.* ?RemoteLogs
& ~
```

Перезапускаем и проверяем сервис

```bash
systemctl restart rsyslog

# Проверяем открытие портов
ss -tulpan | grep :514
udp    UNCONN     0      0         *:514                   *:*                   users:(("rsyslogd",pid=3067,fd=3))
udp    UNCONN     0      0      [::]:514                [::]:*                   users:(("rsyslogd",pid=3067,fd=4))
tcp    LISTEN     0      25        *:514                   *:*                   users:(("rsyslogd",pid=3067,fd=5))
tcp    LISTEN     0      25     [::]:514                [::]:*                   users:(("rsyslogd",pid=3067,fd=6))

```

### Настройка отправки логов с web-сервера

Подключаемся к web хосту

```bash
# Проверяем версию nginx
rpm -qa |grep nginx
nginx-filesystem-1.20.1-10.el7.noarch
nginx-1.20.1-10.el7.x86_64
# или
nginx -v
nginx version: nginx/1.20.1
```

Правим /etc/nginx/nginx.conf

добавляя строки под существующими записями относящимися к локальным логам:

```bash
error_log syslog:server=192.168.56.15:514,tag=nginx_error;

access_log syslog:server=192.168.56.15:514,tag=nginx_access,severity=info combined;
```

Рестартуем nginx

```bash
systemctl restart nginx
```

### Проверка работы

На хосте log выполняем:

```bash
# Запрос по корректному адресу
curl http://192.168.56.10
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
...

# Запрос по ошибочному адресу
curl http://192.168.56.10/ff
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
...
```

Проверяем логи:

```bash
ls -l /var/log/rsyslog/
total 0
drwx------. 2 root root 137 Feb 18 20:28 log
drwx------. 2 root root  53 Feb 18 20:37 web

ls -l /var/log/rsyslog/web
total 8
-rw-------. 1 root root 252 Feb 18 20:37 nginx_access.log
-rw-------. 1 root root 235 Feb 18 20:37 nginx_error.log

cat /var/log/rsyslog/web/nginx_access.log
Feb 18 20:37:32 web nginx_access: 192.168.56.15 - - [18/Feb/2024:20:37:32 +0800] "GET /ff HTTP/1.1" 404 3650 "-" "curl/7.29.0"

cat /var/log/rsyslog/web/nginx_error.log
Feb 18 20:37:32 web nginx_error: 2024/02/18 20:37:32 [error] 22125#22125: *2 open() "/usr/share/nginx/html/ff" failed (2: No such file or directory), client: 192.168.56.15, server: _, request: "GET /ff HTTP/1.1", host: "192.168.56.10"
```

Логи собираются на хосте log.

## **Настройка аудита, контролирующего изменения конфигурации nginx**

Проверяем наличие сервиса аудита

```bash
rpm -qa | grep audit
audit-2.8.5-4.el7.x86_64
audit-libs-2.8.5-4.el7.x86_64
```

Добавим правило, которое будет отслеживать изменения в конфигурации nginx. 

Для этого в конец файла /etc/audit/rules.d/audit.rules добавим следующие строки:

```bash
-w /etc/nginx/nginx.conf -p wa -k nginx_conf
-w /etc/nginx/default.d/ -p wa -k nginx_conf
```

Перезапускаем сервис аудита:

```bash
service auditd restart
```

Вносим некоторые изменения в /etc/nginx/nginx.conf

Проверяем 

```bash
ausearch -f /etc/nginx/nginx.conf
...
----
time->Sun Feb 18 21:04:22 2024
type=PROCTITLE msg=audit(1708261462.231:965): proctitle=76696D002F6574632F6E67696E782F6E67696E782E636F6E66
type=PATH msg=audit(1708261462.231:965): item=0 name="/etc/nginx/nginx.conf" inode=4995267 dev=08:01 mode=0100644 ouid=0 ogid=0 rdev=00:00 obj=system_u:object_r:httpd_config_t:s0 objtype=NORMAL cap_fp=0000000000000000 cap_fi=0000000000000000 cap_fe=0 cap_fver=0
type=CWD msg=audit(1708261462.231:965):  cwd="/root"
type=SYSCALL msg=audit(1708261462.231:965): arch=c000003e syscall=188 success=yes exit=0 a0=9c37c0 a1=7f1891abce2f a2=bb6840 a3=1c items=1 ppid=2965 pid=22267 auid=1000 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=4 comm="vim" exe="/usr/bin/vim" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key="nginx_conf"

grep nginx_conf /var/log/audit/audit.log
...
type=SYSCALL msg=audit(1708261462.231:965): arch=c000003e syscall=188 success=yes exit=0 a0=9c37c0 a1=7f1891abce2f a2=bb6840 a3=1c items=1 ppid=2965 pid=22267 auid=1000 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=4 comm="vim" exe="/usr/bin/vim" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key="nginx_conf"
```

### Настройка пересылки логов аудита на удаленный сервер log

**Настройка на хосте web**

Auditd по умолчанию не умеет пересылать логи, для пересылки на web-сервере потребуется установить пакет **audispd-plugins:**

```bash
yum -y install audispd-plugins
```

В /etc/audit/auditd.conf устанавливаем параметры:

```bash
log_format = RAW
name_format = HOSTNAME
```

В файле /etc/audisp/plugins.d/au-remote.conf поменяем параметр active на **yes**

В файле /etc/audisp/audisp-remote.conf требуется указать адрес сервера и порт, на который будут отправляться логи:

```bash
remote_server = 192.168.56.15
port = 60
```

Рестартуем сервис аудита

```bash
service auditd restart
```

**Настройка на хосте log**

Открываем порт 60

В /etc/audit/auditd.conf открываем порт 60:

```bash
tcp_listen_port = 60
```

Рестартуем сервис аудита

```bash
service auditd restart
```

Настройка закончена.

### Проверка

Инициируем смену атрибута файла конфигурации на хосте web

```bash
ls -l /etc/nginx/nginx.conf
-rw-r--r--. 1 root root 2489 Feb 18 21:04 /etc/nginx/nginx.conf

chmod +x /etc/nginx/nginx.conf

ls -l /etc/nginx/nginx.conf
-rwxr-xr-x. 1 root root 2489 Feb 18 21:04 /etc/nginx/nginx.conf
```

На хосте log проверяем лог аудита:

```bash
grep web /var/log/audit/audit.log 
node=web type=DAEMON_START msg=audit(1708262397.867:9910): op=start ver=2.8.5 format=raw kernel=3.10.0-1127.el7.x86_64 auid=4294967295 pid=22386 uid=0 ses=4294967295 subj=system_u:system_r:auditd_t:s0 res=success
node=web type=CONFIG_CHANGE msg=audit(1708262397.986:971): auid=4294967295 ses=4294967295 subj=system_u:system_r:unconfined_service_t:s0 op=remove_rule key="nginx_conf" list=4 res=1
node=web type=CONFIG_CHANGE msg=audit(1708262397.986:972): auid=4294967295 ses=4294967295 subj=system_u:system_r:unconfined_service_t:s0 op=remove_rule key="nginx_conf" list=4 res=1
node=web type=CONFIG_CHANGE msg=audit(1708262397.987:973): audit_backlog_limit=8192 old=8192 auid=4294967295 ses=4294967295 subj=system_u:system_r:unconfined_service_t:s0 res=1
node=web type=CONFIG_CHANGE msg=audit(1708262397.987:974): audit_failure=1 old=1 auid=4294967295 ses=4294967295 subj=system_u:system_r:unconfined_service_t:s0 res=1
node=web type=CONFIG_CHANGE msg=audit(1708262397.987:975): auid=4294967295 ses=4294967295 subj=system_u:system_r:unconfined_service_t:s0 op=add_rule key="nginx_conf" list=4 res=1
node=web type=CONFIG_CHANGE msg=audit(1708262397.987:976): auid=4294967295 ses=4294967295 subj=system_u:system_r:unconfined_service_t:s0 op=add_rule key="nginx_conf" list=4 res=1
node=web type=SERVICE_START msg=audit(1708262397.989:977): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=auditd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
node=web type=SYSCALL msg=audit(1708262960.110:978): arch=c000003e syscall=268 success=yes exit=0 a0=ffffffffffffff9c a1=68c0f0 a2=1ed a3=7fff331da9a0 items=1 ppid=2965 pid=22418 auid=1000 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=4 comm="chmod" exe="/usr/bin/chmod" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key="nginx_conf"
node=web type=CWD msg=audit(1708262960.110:978):  cwd="/root"
node=web type=PATH msg=audit(1708262960.110:978): item=0 name="/etc/nginx/nginx.conf" inode=4995267 dev=08:01 mode=0100644 ouid=0 ogid=0 rdev=00:00 obj=system_u:object_r:httpd_config_t:s0 objtype=NORMAL cap_fp=0000000000000000 cap_fi=0000000000000000 cap_fe=0 cap_fver=0
node=web type=PROCTITLE msg=audit(1708262960.110:978): proctitle=63686D6F64002B78002F6574632F6E67696E782F6E67696E782E636F6E66
```

Есть информация об изменении атрибута.

## Запуск Vagrant + Ansible

Создаем директорию *ansible* в которой размещаем файлы:

[hosts](ansible/hosts)

[provision.yml](ansible/provision.yml)

Запускаем разворачивание стенда ВМ, предварительно почистив существующие ВМ

```bash
vagrant up
Bringing machine 'web' up with 'virtualbox' provider...
Bringing machine 'log' up with 'virtualbox' provider...
==> web: Importing base box 'centos/7'...
==> web: Matching MAC address for NAT networking...
==> web: Checking if box 'centos/7' version '2004.01' is up to date...
==> web: There was a problem while downloading the metadata for your box
==> web: to check for updates. This is not an error, since it is usually due
==> web: to temporary network problems. This is just a warning. The problem
==> web: encountered was:
==> web:
==> web: The requested URL returned error: 404
==> web:
==> web: If you want to check for box updates, verify your network connection
==> web: is valid and try again.
==> web: Setting the name of the VM: dz16_web_1708347400824_56526
==> web: Clearing any previously set network interfaces...
==> web: Preparing network interfaces based on configuration...
    web: Adapter 1: nat
    web: Adapter 2: hostonly
==> web: Forwarding ports...
    web: 22 (guest) => 2222 (host) (adapter 1)
==> web: Running 'pre-boot' VM customizations...
==> web: Booting VM...
==> web: Waiting for machine to boot. This may take a few minutes...
    web: SSH address: 127.0.0.1:2222
    web: SSH username: vagrant
    web: SSH auth method: private key
    web:
    web: Vagrant insecure key detected. Vagrant will automatically replace
    web: this with a newly generated keypair for better security.
    web:
    web: Inserting generated public key within guest...
    web: Removing insecure key from the guest if it's present...
    web: Key inserted! Disconnecting and reconnecting using new SSH key...
==> web: Machine booted and ready!
==> web: Checking for guest additions in VM...
    web: No guest additions were detected on the base box for this VM! Guest
    web: additions are required for forwarded ports, shared folders, host only
    web: networking, and more. If SSH fails on this machine, please install
    web: the guest additions and repackage the box to continue.
    web:
    web: This is not an error message; everything may continue to work properly,
    web: in which case you may ignore this message.
==> web: Setting hostname...
==> web: Configuring and enabling network interfaces...
==> web: Rsyncing folder: /home/vad/OTUS/dz16/ => /vagrant
==> log: Importing base box 'centos/7'...
==> log: Matching MAC address for NAT networking...
==> log: Checking if box 'centos/7' version '2004.01' is up to date...
==> log: Setting the name of the VM: dz16_log_1708347436692_93389
==> log: Fixed port collision for 22 => 2222. Now on port 2200.
==> log: Clearing any previously set network interfaces...
==> log: Preparing network interfaces based on configuration...
    log: Adapter 1: nat
    log: Adapter 2: hostonly
==> log: Forwarding ports...
    log: 22 (guest) => 2200 (host) (adapter 1)
==> log: Running 'pre-boot' VM customizations...
==> log: Booting VM...
==> log: Waiting for machine to boot. This may take a few minutes...
    log: SSH address: 127.0.0.1:2200
    log: SSH username: vagrant
    log: SSH auth method: private key
    log:
    log: Vagrant insecure key detected. Vagrant will automatically replace
    log: this with a newly generated keypair for better security.
    log:
    log: Inserting generated public key within guest...
    log: Removing insecure key from the guest if it's present...
    log: Key inserted! Disconnecting and reconnecting using new SSH key...
==> log: Machine booted and ready!
==> log: Checking for guest additions in VM...
    log: No guest additions were detected on the base box for this VM! Guest
    log: additions are required for forwarded ports, shared folders, host only
    log: networking, and more. If SSH fails on this machine, please install
    log: the guest additions and repackage the box to continue.
    log:
    log: This is not an error message; everything may continue to work properly,
    log: in which case you may ignore this message.
==> log: Setting hostname...
==> log: Configuring and enabling network interfaces...
==> log: Rsyncing folder: /home/vad/OTUS/dz16/ => /vagrant
==> log: Running provisioner: ansible...
    log: Running ansible-playbook...
[WARNING]: Found both group and host with same name: web
[WARNING]: Found both group and host with same name: log

PLAY [Config all server] *******************************************************

TASK [Gathering Facts] *********************************************************
ok: [log]
ok: [web]

TASK [Set localtime] ***********************************************************
changed: [log]
changed: [web]

TASK [Restart chronyd] *********************************************************
changed: [log]
changed: [web]

TASK [Install packages] ********************************************************
changed: [log]
changed: [web]

PLAY [Config web server] *******************************************************

TASK [Gathering Facts] *********************************************************
ok: [web]

TASK [Install epel] ************************************************************
changed: [web]

TASK [Install nginx] ***********************************************************
changed: [web]

TASK [Config error_log] ********************************************************
changed: [web]

TASK [Config access_log] *******************************************************
changed: [web]

TASK [Nginx audit] *************************************************************
changed: [web] => (item=-w /etc/nginx/nginx.conf -p wa -k nginx_conf)
changed: [web] => (item=-w /etc/nginx/default.d/ -p wa -k nginx_conf)

TASK [Config auditd] ***********************************************************
changed: [web]

TASK [Config au-remote] ********************************************************
changed: [web]

TASK [Config audisp-remote] ****************************************************
changed: [web]

TASK [restart auditd] **********************************************************
changed: [web]
[WARNING]: Consider using the service module rather than running 'service'.  If
you need to use command because service is insufficient you can add 'warn:
false' to this command task or set 'command_warnings=False' in ansible.cfg to
get rid of this message.

TASK [Start nginx] *************************************************************
changed: [web]

PLAY [Config log server] *******************************************************

TASK [Gathering Facts] *********************************************************
ok: [log]

TASK [Edit rsyslog0] ***********************************************************
ok: [log]

TASK [Edit rsyslog1] ***********************************************************
changed: [log] => (item=module(load="imudp"))
changed: [log] => (item=input(type="imudp" port="514"))
changed: [log] => (item=module(load="imtcp"))
changed: [log] => (item=input(type="imtcp" port="514"))
changed: [log] => (item=$template RemoteLogs,"/var/log/rsyslog/%HOSTNAME%/%PROGRAMNAME%.log")
changed: [log] => (item=*.* ?RemoteLogs)
changed: [log] => (item=& ~)

TASK [Config auditd] ***********************************************************
changed: [log]

TASK [Restart auditd] **********************************************************
changed: [log]

TASK [restart rsyslog] *********************************************************
changed: [log]

PLAY RECAP *********************************************************************
log                        : ok=10   changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
web                        : ok=15   changed=13   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

Настройка разворачивания стенда ВМ отработала.