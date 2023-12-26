#!/bin/bash

###
# Selinux disable
setenforce 0
# Firewall disable
systemctl stop firewalld.service


## 1. Сервис мониторинга лога по ключевому слову

# Создаем watchlog.log 
dmesg > /var/log/watchlog.log

# Формируем config-файл
cat <<EOF > /etc/sysconfig/watchlog
# Configuration file for my watchlog service
# Place it to /etc/sysconfig

# File and word in that file that we will be monit
WORD="OS "
LOG=/var/log/watchlog.log
EOF

# Создаем скрипт обработки log-файла - /opt/watchlog.sh
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

# Создаем юнит для сервиса
cat <<EOF > /etc/systemd/system/watchlog.service
[Unit]
Description=My watchlog service

[Service]
Type=oneshot
EnvironmentFile=/etc/sysconfig/watchlog
ExecStart=/opt/watchlog.sh \$WORD \$LOG
EOF

# Создаем юнит для таймера
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

# Стартуем timer
systemctl start watchlog.timer



## spawn-fcgi as service

yum install epel-release -y && yum install spawn-fcgi php php-cli mod_fcgid httpd -y

# Раскомментируем строки с переменными в /etc/sysconfig/spawn-fcgi
mv  /etc/sysconfig/spawn-fcgi /etc/sysconfig/spawn-fcgi.orig
cat /etc/sysconfig/spawn-fcgi.orig |sed 's/#SOCKET/SOCKET/'|sed 's/#OPTIONS/OPTIONS/'>/etc/sysconfig/spawn-fcgi

# Создаем юнит для сервиса spawn-fcgi:
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

# Запуск сервиса spawn-fcgi
systemctl start spawn-fcgi

## Запуск несколько инстансов сервера httpd с разными конфигурационными файлами

# Правим конфигурацию окружения - добавляем шаблон
mv  /usr/lib/systemd/system/httpd.service /usr/lib/systemd/system/httpd.service.orig
cat /usr/lib/systemd/system/httpd.service.orig |sed '/Environment/a EnvironmentFile=/etc/sysconfig/httpd-%I'>/usr/lib/systemd/system/httpd.service

# Создаем два файла окружения
echo "OPTIONS=-f conf/first.conf" > /etc/sysconfig/httpd-first
echo "OPTIONS=-f conf/second.conf" > /etc/sysconfig/httpd-second

# Формируем два config-файла с распределением по портам 8081 и 8082
cat /etc/httpd/conf/httpd.conf | sed ' 43a \PidFile /var/run/httpd-first.pid' | sed 's/Listen 80/Listen 8081/' > /etc/httpd/conf/first.conf
cat /etc/httpd/conf/httpd.conf | sed ' 43a \PidFile /var/run/httpd-second.pid' | sed 's/Listen 80/Listen 8082/' > /etc/httpd/conf/second.conf

# Запуск двух конфигураций httpd
systemctl start httpd@first
systemctl start httpd@second

# Проверка портов
ss -tupln | grep httpd
