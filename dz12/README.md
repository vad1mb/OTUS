# Домашнее задание 12. SELINUX

**Цель домашнего задания**

Диагностировать проблемы и модифицировать политики SELinux для корректной работы приложений, если это требуется.

**Описание домашнего задания**

1. Запустить nginx на нестандартном порту 3-мя разными способами:

- переключатели setsebool;
- добавление нестандартного порта в имеющийся тип;
- формирование и установка модуля SELinux.

К сдаче:  README с описанием каждого решения (скриншоты и демонстрация приветствуются).


2. Обеспечить работоспособность приложения при включенном selinux.

- развернуть приложенный стенд [https://github.com/mbfx/otus-linux-adm/tree/master/selinux_dns_problems](https://github.com/mbfx/otus-linux-adm/tree/master/selinux_dns_problems);
- выяснить причину неработоспособности механизма обновления зоны (см. README);
- предложить решение (или решения) для данной проблемы;
- выбрать одно из решений для реализации, предварительно обосновав выбор;
- реализовать выбранное решение и продемонстрировать его работоспособность


[Vagrantfile](Vagrantfile)

Результатом выполнения команды *vagrant up* станет созданная виртуальная машина с установленным nginx, который работает на порту TCP 4881. Порт TCP 4881 уже проброшен до хоста. SELinux включен.

Во время развёртывания стенда попытка запустить nginx завершается с ошибкой:

```jsx
selinux: ● nginx.service - The nginx HTTP and reverse proxy server
    selinux:    Loaded: loaded (/usr/lib/systemd/system/nginx.service; disabled; vendor preset: disabled)
    selinux:    Active: failed (Result: exit-code) since Sun 2024-01-14 11:39:12 UTC; 25ms ago
    selinux:   Process: 2192 ExecStartPre=/usr/sbin/nginx -t (code=exited, status=1/FAILURE)
    selinux:   Process: 2191 ExecStartPre=/usr/bin/rm -f /run/nginx.pid (code=exited, status=0/SUCCESS)
    selinux:
    selinux: Jan 14 11:39:12 localhost.localdomain systemd[1]: Starting The nginx HTTP and reverse proxy server...
    selinux: Jan 14 11:39:12 localhost.localdomain nginx[2192]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
    selinux: Jan 14 11:39:12 localhost.localdomain nginx[2192]: nginx: [emerg] bind() to 0.0.0.0:4881 failed (13: Permission denied)
    selinux: Jan 14 11:39:12 localhost.localdomain nginx[2192]: nginx: configuration file /etc/nginx/nginx.conf test failed
    selinux: Jan 14 11:39:12 localhost.localdomain systemd[1]: nginx.service: control process exited, code=exited status=1
    selinux: Jan 14 11:39:12 localhost.localdomain systemd[1]: Failed to start The nginx HTTP and reverse proxy server.
    selinux: Jan 14 11:39:12 localhost.localdomain systemd[1]: Unit nginx.service entered failed state.
    selinux: Jan 14 11:39:12 localhost.localdomain systemd[1]: nginx.service failed.
```

# Решение

Для работы понадобится `audit2why` , устанавливаем:

```bash
yum install -y policycoreutils-python
```

## **Запуск nginx на нестандартном порту 3-мя разными способами**

Проверяем, что файрвол выключен:

```bash
systemctl status firewalld
● firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; disabled; vendor preset: enabled)
   Active: inactive (dead)
     Docs: man:firewalld(1)
```

Проверяем, что конфигурация nginx настроена без ошибок:

```bash
nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

Проверяем, что SELinux включен:

```bash
getenforce
Enforcing
```

### 1. **Разрешаем в SELinux работу nginx на порту TCP 4881 c помощью переключателей setsebool**

Находим в логах (/var/log/audit/audit.log) информацию о блокировании порта:

```bash
cat /var/log/audit/audit.log|grep 4881
type=AVC msg=audit(1705240308.168:447): avc:  denied  { name_bind } for  pid=2263 comm="nginx" src=4881 scontext=system_u:system_r:httpd_t:s0 tcontext=system_u:object_r:unreserved_port_t:s0 tclass=tcp_socket permissive=0
```

Время события - 1705240308.168:447

Производим анализ события:

```bash
/var/log/audit/audit.log | audit2why
type=AVC msg=audit(1705240308.168:447): avc:  denied  { name_bind } for  pid=2263 comm="nginx" src=4881 scontext=system_u:system_r:httpd_t:s0 tcontext=system_u:object_r:unreserved_port_t:s0 tclass=tcp_socket permissive=0

        Was caused by:
        The boolean nis_enabled was set incorrectly.
        Description:
        Allow nis to enabled

        Allow access by executing:
        # setsebool -P nis_enabled 1
```

Рекомендуется сделать:

```bash
setsebool -P nis_enabled on
systemctl restart nginx
systemctl status nginx
● nginx.service - The nginx HTTP and reverse proxy server
   Loaded: loaded (/usr/lib/systemd/system/nginx.service; disabled; vendor preset: disabled)
   Active: active (running) since Sun 2024-01-14 13:59:17 UTC; 7s ago
  Process: 2365 ExecStart=/usr/sbin/nginx (code=exited, status=0/SUCCESS)
  Process: 2364 ExecStartPre=/usr/sbin/nginx -t (code=exited, status=0/SUCCESS)
  Process: 2362 ExecStartPre=/usr/bin/rm -f /run/nginx.pid (code=exited, status=0/SUCCESS)
 Main PID: 2367 (nginx)
   CGroup: /system.slice/nginx.service
           ├─2367 nginx: master process /usr/sbin/nginx
           └─2369 nginx: worker process

Jan 14 13:59:17 localhost.localdomain systemd[1]: Starting The nginx HTTP and reverse proxy server...
Jan 14 13:59:17 localhost.localdomain nginx[2364]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
Jan 14 13:59:17 localhost.localdomain nginx[2364]: nginx: configuration file /etc/nginx/nginx.conf test is successful
Jan 14 13:59:17 localhost.localdomain systemd[1]: Started The nginx HTTP and reverse proxy server.

getsebool -a | grep nis_enabled
nis_enabled --> on
```

Вернём запрет работы nginx на порту 4881 обратно. Для этого отключим nis_enabled:

```bash
setsebool -P nis_enabled off

getsebool -a | grep nis_enabled
nis_enabled --> off

systemctl restart nginx
Job for nginx.service failed because the control process exited with error code. See "systemctl status nginx.service" and "journalctl -xe" for details.
```

## 2. Добавление нестандартного порта в имеющийся тип.

Теперь разрешим в SELinux работу nginx на порту TCP 4881 c помощью добавления нестандартного порта в имеющийся тип.

Поиск имеющегося типа, для http трафика:

```bash
semanage port -l | grep http
http_cache_port_t              tcp      8080, 8118, 8123, 10001-10010
http_cache_port_t              udp      3130
http_port_t                    tcp      80, 81, 443, 488, 8008, 8009, 8443, 9000
pegasus_http_port_t            tcp      5988
pegasus_https_port_t           tcp      5989
```

Добавим порт в тип http_port_t:

```bash
semanage port -a -t http_port_t -p tcp 4881

semanage port -l | grep  http_port_t
http_port_t                    tcp      4881, 80, 81, 443, 488, 8008, 8009, 8443, 9000
pegasus_http_port_t            tcp      5988
```

Проверяем сервис nginx:

```bash
systemctl restart nginx

systemctl status nginx
● nginx.service - The nginx HTTP and reverse proxy server
   Loaded: loaded (/usr/lib/systemd/system/nginx.service; disabled; vendor preset: disabled)
   Active: active (running) since Sun 2024-01-14 14:06:56 UTC; 3s ago
  Process: 2430 ExecStart=/usr/sbin/nginx (code=exited, status=0/SUCCESS)
  Process: 2427 ExecStartPre=/usr/sbin/nginx -t (code=exited, status=0/SUCCESS)
  Process: 2426 ExecStartPre=/usr/bin/rm -f /run/nginx.pid (code=exited, status=0/SUCCESS)
 Main PID: 2432 (nginx)
   CGroup: /system.slice/nginx.service
           ├─2432 nginx: master process /usr/sbin/nginx
           └─2434 nginx: worker process

Jan 14 14:06:56 localhost.localdomain systemd[1]: Starting The nginx HTTP and reverse proxy server...
Jan 14 14:06:56 localhost.localdomain nginx[2427]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
Jan 14 14:06:56 localhost.localdomain nginx[2427]: nginx: configuration file /etc/nginx/nginx.conf test is successful
Jan 14 14:06:56 localhost.localdomain systemd[1]: Started The nginx HTTP and reverse proxy server.
```

Работает.

Возвращаем к первоначальному состоянию ошибки:

```bash
semanage port -d -t http_port_t -p tcp 4881

semanage port -l | grep  http_port_t
http_port_t                    tcp      80, 81, 443, 488, 8008, 8009, 8443, 9000
pegasus_http_port_t            tcp      5988

systemctl restart nginx
Job for nginx.service failed because the control process exited with error code. See "systemctl status nginx.service" and "journalctl -xe" for details.
```

### 3. Формирование и установка модуля SELinux

Воспользуемся утилитой audit2allow для того, чтобы на основе логов SELinux сделать модуль, разрешающий работу nginx на нестандартном порту:

```bash
grep nginx /var/log/audit/audit.log | audit2allow -M nginx
******************** IMPORTANT ***********************
To make this policy package active, execute:

semodule -i nginx.pp
```

Модуль сформирован, применяем его:

```bash
semodule -i nginx.pp
```

Проверяем:

```bash
systemctl restart nginx

systemctl status nginx
● nginx.service - The nginx HTTP and reverse proxy server
   Loaded: loaded (/usr/lib/systemd/system/nginx.service; disabled; vendor preset: disabled)
   Active: active (running) since Sun 2024-01-14 14:14:30 UTC; 8s ago
  Process: 2483 ExecStart=/usr/sbin/nginx (code=exited, status=0/SUCCESS)
  Process: 2481 ExecStartPre=/usr/sbin/nginx -t (code=exited, status=0/SUCCESS)
  Process: 2480 ExecStartPre=/usr/bin/rm -f /run/nginx.pid (code=exited, status=0/SUCCESS)
 Main PID: 2485 (nginx)
   CGroup: /system.slice/nginx.service
           ├─2485 nginx: master process /usr/sbin/nginx
           └─2487 nginx: worker process

Jan 14 14:14:30 localhost.localdomain systemd[1]: Starting The nginx HTTP and reverse proxy server...
Jan 14 14:14:30 localhost.localdomain nginx[2481]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
Jan 14 14:14:30 localhost.localdomain nginx[2481]: nginx: configuration file /etc/nginx/nginx.conf test is successful
Jan 14 14:14:30 localhost.localdomain systemd[1]: Started The nginx HTTP and reverse proxy server.
```

nginx работает.

nginx.pp - это модуль в “компилированном” виде

nginx.te - это модуль в читаемом виде:

```bash
cat nginx.te

module nginx 1.0;

require {
        type httpd_t;
        type unreserved_port_t;
        class tcp_socket name_bind;
}

#============= httpd_t ==============

#!!!! This avc can be allowed using the boolean 'nis_enabled'
allow httpd_t unreserved_port_t:tcp_socket name_bind;
```

Для удаления модуля используется команда:

```bash
semodule -r nginx
```

---
