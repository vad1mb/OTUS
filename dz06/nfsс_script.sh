#!/bin/bash

yum install nfs-utils -y

# Включаем Firewall 
systemctl enable firewalld --now

# Для автомонтирования добавляем строку в /etc/fstab
echo "192.168.50.10:/srv/share/ /mnt nfs vers=3,proto=udp,noauto,x-systemd.automount 0 0" >> /etc/fstab

# Перечитываем конфигурацию и рестартуем сервис
systemctl daemon-reload
systemctl restart remote-fs.target
