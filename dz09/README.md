# Домашнее задание 9. Systemd - создание unit-файла

## Цель

Научиться редактировать существующие и создавать новые unit-файлы;

## Задание

Выполнить следующие задания и подготовить развёртывание результата выполнения с использованием Vagrant и Vagrant shell provisioner

1. Написать service, который будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова (файл лога и ключевое слово должны задаваться в /etc/sysconfig или в /etc/default).
2. Установить spawn-fcgi и переписать init-скрипт на unit-файл (имя service должно называться так же: spawn-fcgi).
3. Дополнить unit-файл httpd (он же apache2) возможностью запустить несколько инстансов сервера с разными конфигурационными файлами.

<aside>
💡 **Отключить SElinux и firewalld.**
Для отключения SELinux нужно открыть файл /etc/sysconfig/selinux и установить параметр SELINUX=disabled. 
`setenforce 0` - для временного отключения SELinux
Для отключения firewall

`systemctl stop firewalld.service`
`systemctl disable firewalld.service`

</aside>

# Решение

### 1. Сервис мониторинга лога по ключевому слову

В качестве log-файла используем вывод dmesg в /var/log/watchlog.log

```bash
dmesg > /var/log/watchlog.log
```

В качестве искомого слова - OS

Задаем в config-файле

```bash
cat <<EOF > /etc/sysconfig/watchlog
# Configuration file for my watchlog service
# Place it to /etc/sysconfig

# File and word in that file that we will be monit
WORD="OS "
LOG=/var/log/watchlog.log
EOF
```

Создаем скрипт обработки log-файла - /opt/watchlog.sh

```bash
cat <<EOF > /opt/watchlog.sh
#!/bin/bash

WORD=\$1
LOG=\$2
DATE=\`date\`

if grep \$WORD \$LOG &> /dev/null
then
  logger "\$DATE: I found word \$WORD, Master!"
else
  exit 0
fi
EOF

chmod +x /opt/watchlog.sh
```

Создаем юнит для сервиса:

```bash
cat <<EOF > /etc/systemd/system/watchlog.service
[Unit]
Description=My watchlog service

[Service]
Type=oneshot
EnvironmentFile=/etc/sysconfig/watchlog
ExecStart=/opt/watchlog.sh \$WORD \$LOG
EOF
```

Создаем юнит для таймера:

```bash
cat <<EOF > /etc/systemd/system/watchlog.timer
[Unit]
Description=Run watchlog script every 30 second

[Timer]
# Run every 30 second
OnUnitActiveSec=30
Unit=watchlog.service

[Install]
WantedBy=multi-user.target
EOF
```

Стартуем timer

```bash
systemctl start watchlog.timer
```

```bash
tail -f /var/log/messages
...
Dec 25 08:04:05 centos8s systemd[1]: Starting My watchlog service...
Dec 25 08:04:05 centos8s root[2166]: Mon Dec 25 08:04:05 UTC 2023: I found word OS, Master!     
Dec 25 08:04:05 centos8s systemd[1]: watchlog.service: Succeeded.
Dec 25 08:04:05 centos8s systemd[1]: Started My watchlog service.
Dec 25 08:04:36 centos8s systemd[1]: Starting My watchlog service...
Dec 25 08:04:36 centos8s root[2171]: Mon Dec 25 08:04:36 UTC 2023: I found word OS, Master!     
Dec 25 08:04:36 centos8s systemd[1]: watchlog.service: Succeeded.
Dec 25 08:04:36 centos8s systemd[1]: Started My watchlog service.
Dec 25 08:05:07 centos8s systemd[1]: Starting My watchlog service...
Dec 25 08:05:07 centos8s root[2177]: Mon Dec 25 08:05:07 UTC 2023: I found word OS, Master!     
Dec 25 08:05:07 centos8s systemd[1]: watchlog.service: Succeeded.
Dec 25 08:05:07 centos8s systemd[1]: Started My watchlog service.
...
```

Сервис работает.

### 2. Установить spawn-fcgi и переписать init-скрипт на unit-файл (имя service должно называться так же: spawn-fcgi).

```bash
yum install epel-release -y && yum install spawn-fcgi php php-cli mod_fcgid httpd -y
```

Раскомментируем строки с переменными в /etc/sysconfig/spawn-fcgi

```bash
mv  /etc/sysconfig/spawn-fcgi /etc/sysconfig/spawn-fcgi.orig
cat /etc/sysconfig/spawn-fcgi.orig |sed 's/#SOCKET/SOCKET/'|sed 's/#OPTIONS/OPTIONS/'>/etc/sysconfig/spawn-fcgi
```

Создаем юнит для сервиса spawn-fcgi:

```bash
cat <<EOF > /etc/systemd/system/spawn-fcgi.service
[Unit]
Description=Spawn-fcgi startup service by Otus
After=network.target

[Service]
Type=simple
PIDFile=/var/run/spawn-fcgi.pid
EnvironmentFile=/etc/sysconfig/spawn-fcgi
ExecStart=/usr/bin/spawn-fcgi -n \$OPTIONS
KillMode=process

[Install]
WantedBy=multi-user.target
EOF
```

Запускаем и проверяем

```bash
systemctl start spawn-fcgi
systemctl status spawn-fcgi
● spawn-fcgi.service - Spawn-fcgi startup service by Otus
   Loaded: loaded (/etc/systemd/system/spawn-fcgi.service; disabled; vendor preset: disabled)
   Active: active (running) since Tue 2023-12-26 03:40:45 UTC; 5s ago
 Main PID: 15354 (php-cgi)
    Tasks: 33 (limit: 11068)
   Memory: 19.1M
   CGroup: /system.slice/spawn-fcgi.service
           ├─15354 /usr/bin/php-cgi
           ├─15355 /usr/bin/php-cgi
...
```

Работает.

### 3. Дополнить unit-файл httpd (он же apache2) возможностью запустить несколько инстансов сервера с разными конфигурационными файлами.

Правим конфигурацию окружения - добавляем шаблон:

```bash
mv  /usr/lib/systemd/system/httpd.service /usr/lib/systemd/system/httpd.service.orig
cat /usr/lib/systemd/system/httpd.service.orig |sed '/Environment/a EnvironmentFile=/etc/sysconfig/httpd-%I'>/usr/lib/systemd/system/httpd.service
```

Создаем два файла окружения:

```bash
echo "OPTIONS=-f conf/first.conf" > /etc/sysconfig/httpd-first
echo "OPTIONS=-f conf/second.conf" > /etc/sysconfig/httpd-second
```

Формируем два config-файла с распределением по портам 8081 и 8082:

```bash
cat /etc/httpd/conf/httpd.conf | sed ' 43a \PidFile /var/run/httpd-first.pid' | sed 's/Listen 80/Listen 8081/' > /etc/httpd/conf/first.conf
cat /etc/httpd/conf/httpd.conf | sed ' 43a \PidFile /var/run/httpd-second.pid' | sed 's/Listen 80/Listen 8082/' > /etc/httpd/conf/second.conf
```

Запускаем и проверяем

```bash
systemctl start httpd@first
systemctl start httpd@second

ss -tupln | grep httpd
tcp   LISTEN 0      511          0.0.0.0:8081      0.0.0.0:*    users:(("httpd",pid=16580,fd=3),("httpd",pid=16579,fd=3),("httpd",pid=16578,fd=3),("httpd",pid=16577,fd=3),("httpd",pid=16575,fd=3))
tcp   LISTEN 0      511          0.0.0.0:8082      0.0.0.0:*    users:(("httpd",pid=16810,fd=3),("httpd",pid=16809,fd=3),("httpd",pid=16808,fd=3),("httpd",pid=16807,fd=3),("httpd",pid=16805,fd=3))
```

httpd запущен на портах 8081 и 8082
