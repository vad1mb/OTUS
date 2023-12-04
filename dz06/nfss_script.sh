#!/bin/bash

yum install nfs-utils

# Включаем Firewall 
systemctl enable firewalld --now
# Разрешаем доступ к NFS
firewall-cmd --add-service="nfs3" --add-service="rpc-bind" --add-service="mountd" --permanent
# Перегружаем Firewall
firewall-cmd --reload

# Включаем сервер NFS
systemctl enable nfs --now

# Создаем директорию
mkdir -p /srv/share/upload
chown -R nfsnobody:nfsnobody /srv/share
chmod 0777 /srv/share/upload

# Настройка экспорта созданной директории
cat << EOF > /etc/exports
/srv/share 192.168.50.11/32(rw,sync,root_squash)
EOF

# Экспортируем директорию
exportfs -r
