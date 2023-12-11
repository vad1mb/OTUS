# Домашнее задание 6. NFS

## Задание

- vagrant up должен поднимать 2 виртуалки: сервер и клиент;
- на сервер должна быть расшарена директория;
- на клиента она должна автоматически монтироваться при старте (fstab или autofs);
- в шаре должна быть папка upload с правами на запись;
- требования для NFS: NFSv3 по UDP, включенный firewall.

## Решение

Vagrantfile:

```bash
# -*- mode: ruby -*- 
# vi: set ft=ruby : vsa

Vagrant.configure(2) do |config| 
 config.vm.box = "centos/7" 
 config.vm.box_version = "2004.01" 
 config.vm.provider "virtualbox" do |v| 
 v.memory = 256 
 v.cpus = 1 
 end 
 config.vm.define "nfss" do |nfss| 
 nfss.vm.network "private_network", ip: "192.168.50.10",  virtualbox__intnet: "net1" 
 nfss.vm.hostname = "nfss" 
 end 
 config.vm.define "nfsc" do |nfsc| 
 nfsc.vm.network "private_network", ip: "192.168.50.11",  virtualbox__intnet: "net1" 
 nfsc.vm.hostname = "nfsc" 
 end 
end
```

В результате запуска поднимается 2 ВМ
сервер: nfss 192.168.50.10
клиент: nfsc 192.168.50.11

### Настройка NFS сервера

`vagrant ssh nfss`

```bash
sudo -i

# Установка дополнительного ПО
yum install nfs-utils -y

# Запуск Firewall
systemctl enable firewalld --now
# Разрешаем NFS на Firewall
firewall-cmd --add-service="nfs3" --add-service="rpc-bind" --add-service="mountd" --permanent 
firewall-cmd --reload
# Проверяем состояние Firewall
systemctl status firewalld
● firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; enabled; vendor preset: enabled)
   Active: active (running) since Wed 2023-12-06 02:59:52 UTC; 2min 25s ago
...

# Включаем сервер NFS
systemctl enable nfs --now
# Проверяем открытые порты
ss -tnplu | grep -E "2049|20048|111"
udp    UNCONN     0      0         *:2049                  *:*
udp    UNCONN     0      0         *:20048                 *:*                   users:(("rpc.mountd",pid=2352,fd=7))
udp    UNCONN     0      0         *:111                   *:*                   users:(("rpcbind",pid=342,fd=6))
udp    UNCONN     0      0      [::]:2049               [::]:*
udp    UNCONN     0      0      [::]:20048              [::]:*                   users:(("rpc.mountd",pid=2352,fd=9))
udp    UNCONN     0      0      [::]:111                [::]:*                   users:(("rpcbind",pid=342,fd=9))
tcp    LISTEN     0      128       *:111                   *:*                   users:(("rpcbind",pid=342,fd=8))
tcp    LISTEN     0      128       *:20048                 *:*                   users:(("rpc.mountd",pid=2352,fd=8))
tcp    LISTEN     0      64        *:2049                  *:*
tcp    LISTEN     0      128    [::]:111                [::]:*                   users:(("rpcbind",pid=342,fd=11))
tcp    LISTEN     0      128    [::]:20048              [::]:*                   users:(("rpc.mountd",pid=2352,fd=10))
tcp    LISTEN     0      64     [::]:2049               [::]:*

# Создаем директорию для экспорта
mkdir -p /srv/share/upload 
chown -R nfsnobody:nfsnobody /srv/share 
chmod 0777 /srv/share/upload

# Прописываем в /etc/exports созданную директорию для экспорта
cat << EOF > /etc/exports 
/srv/share 192.168.50.11/32(rw,sync,root_squash)
EOF

# Активируем экспорт
exportfs -r
# Проверяем
exportfs -s
/srv/share  192.168.50.11/32(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,root_squash,no_all_squash)
```

### Настройка NFS клиента

`vagrant ssh nfsc`

```bash
sudo -i

# Установка дополнительного ПО
yum install nfs-utils -y

# Запуск Firewall
systemctl enable firewalld --now
# Проверяем состояние Firewall
systemctl status firewalld 
● firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; enabled; vendor preset: enabled)   Active: active (running) since Wed 2023-12-06 03:17:33 UTC; 18s ago
...

# Прописываем фс для монтирования в /etc/fstab
echo "192.168.56.10:/srv/share/ /mnt nfs vers=3,proto=udp,noauto,x-systemd.automount 0 0" >> /etc/fstab

# Перечитываем конфигурацию
systemctl daemon-reload 
systemctl restart remote-fs.target

# Проверяем монтирование
cd /mnt
mount | grep mnt 
systemd-1 on /mnt type autofs (rw,relatime,fd=46,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=25659)
192.168.50.10:/srv/share/ on /mnt type nfs (rw,relatime,vers=3,rsize=32768,wsize=32768,namlen=255,hard,proto=udp,timeo=11,retrans=3,sec=sys,mountaddr=192.168.50.10,mountvers=3,mountport=20048,mountproto=udp,local_lock=none,addr=192.168.50.10)
```

### Проверка работоспособности

Подключаемся к nfss - `vagrant ssh nfss`

```bash
cd /srv/share/upload
touch check_file
ls -la
total 0
drwxrwxrwx. 2 nfsnobody nfsnobody 24 Dec 11 06:44 .
drwxr-xr-x. 3 nfsnobody nfsnobody 20 Dec 11 06:19 ..
-rw-rw-r--. 1 vagrant   vagrant    0 Dec 11 06:44 check_file
```

Подключаемся к nfsc - `vagrant ssh nfsc`

```bash
cd /mnt/upload
ls -la
total 0
drwxrwxrwx. 2 nfsnobody nfsnobody 24 Dec 11 06:44 .
drwxr-xr-x. 3 nfsnobody nfsnobody 20 Dec 11 06:19 ..
-rw-rw-r--. 1 vagrant   vagrant    0 Dec 11 06:44 check_file

# Создаем файл
touch client_file
ls -la
total 0
drwxrwxrwx. 2 nfsnobody nfsnobody 43 Dec 11 06:48 .
drwxr-xr-x. 3 nfsnobody nfsnobody 20 Dec 11 06:19 ..
-rw-rw-r--. 1 vagrant   vagrant    0 Dec 11 06:44 check_file
-rw-rw-r--. 1 vagrant   vagrant    0 Dec 11 06:48 client_file
```

Перегружаем клиент - `vagrant reload nfsc`

`vagrant ssh nfsc`

```bash
cd /mnt/upload
ls -l
total 0
-rw-rw-r--. 1 vagrant vagrant 0 Dec 11 06:44 check_file
-rw-rw-r--. 1 vagrant vagrant 0 Dec 11 06:48 client_file
# Файлы на месте
```

Перегружаем сервер - `vagrant reload nfss`

```bash
cd /srv/share/upload
ls -la
total 0
drwxrwxrwx. 2 nfsnobody nfsnobody 43 Dec 11 06:48 .
drwxr-xr-x. 3 nfsnobody nfsnobody 20 Dec 11 06:19 ..
-rw-rw-r--. 1 vagrant   vagrant    0 Dec 11 06:44 check_file
-rw-rw-r--. 1 vagrant   vagrant    0 Dec 11 06:48 client_file
# Файлы на месте

# NFS status
systemctl status nfs
● nfs-server.service - NFS server and services
   Loaded: loaded (/usr/lib/systemd/system/nfs-server.service; enabled; vendor preset: disabled)
  Drop-In: /run/systemd/generator/nfs-server.service.d
           └─order-with-mounts.conf
   Active: active (exited) since Mon 2023-12-11 06:55:43 UTC; 1min 52s ago
  Process: 834 ExecStartPost=/bin/sh -c if systemctl -q is-active gssproxy; then systemctl reload gssproxy ; fi (code=exited, status=0/SUCCESS)
  Process: 810 ExecStart=/usr/sbin/rpc.nfsd $RPCNFSDARGS (code=exited, status=0/SUCCESS)
  Process: 807 ExecStartPre=/usr/sbin/exportfs -r (code=exited, status=0/SUCCESS)
 Main PID: 810 (code=exited, status=0/SUCCESS)
   CGroup: /system.slice/nfs-server.service

# firewall status
systemctl status firewalld
● firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; enabled; vendor preset: enabled)
   Active: active (running) since Mon 2023-12-11 06:55:39 UTC; 2min 47s ago
     Docs: man:firewalld(1)
 Main PID: 409 (firewalld)
   CGroup: /system.slice/firewalld.service
           └─409 /usr/bin/python2 -Es /usr/sbin/firewalld --nofork --nopid

# проверяем экспорты
exportfs -s
/srv/share  192.168.50.11/32(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,root_squash,no_all_squash)
```

Перегружаем клиент - `vagrant reload nfsc`

`vagrant ssh nfsc`

```bash
showmount -e 192.168.50.10
Export list for 192.168.50.10:
/srv/share 192.168.50.11/32
cd /mnt/upload
mount | grep mnt
systemd-1 on /mnt type autofs (rw,relatime,fd=27,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=10946)
192.168.50.10:/srv/share/ on /mnt type nfs (rw,relatime,vers=3,rsize=32768,wsize=32768,namlen=255,hard,proto=udp,timeo=11,retrans=3,sec=sys,mountaddr=192.168.50.10,mountvers=3,mountport=20048,mountproto=udp,local_lock=none,addr=192.168.50.10)

# Создаем файл
touch final_check
ls -la
total 0
drwxrwxrwx. 2 nfsnobody nfsnobody 62 Dec 11 07:02 .
drwxr-xr-x. 3 nfsnobody nfsnobody 20 Dec 11 06:19 ..
-rw-rw-r--. 1 vagrant   vagrant    0 Dec 11 06:44 check_file
-rw-rw-r--. 1 vagrant   vagrant    0 Dec 11 06:48 client_file
-rw-rw-r--. 1 vagrant   vagrant    0 Dec 11 07:02 final_check
```

Все проверки пройдены - стенд работоспособен.

## Создание конечной конфигурации стенда

Удаляем существующие ВМ - `vagrant destroy -f`

В Vagrantfil-ы добавляем скрипты:

**nfss_script.sh** - для NFS сервера

**nfsc_script.sh** - для клиента

в которых производится конфигурирование стенда.

Запускаем ВМ - `vagrant up`

Проверяем по [Проверка работоспособности](https://goo.su/ce0D)
Все проверки пройдены - стенд работоспособен.
