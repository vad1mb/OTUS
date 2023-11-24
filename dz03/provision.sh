#!/bin/bash

mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.ssh

# Обновление списка пакетов и установка mdadm martmontools hdparm gdisk
sudo yum update
sudo yum install -y mdadm smartmontools hdparm gdisk

# Проверка существование метаустройства
if grep -q "/dev/md0" /etc/fstab; then
  echo -e "\nMetadevice /dev/md0 is present! \nPlease unmount metadevice and move the corresponding line in /etc/fstab."
  exit
fi

# Создание массива RAID 10
sudo mdadm --zero-superblock --force /dev/sd{b,c,d,e,f}
sudo mdadm --create --verbose /dev/md0 --level=10 --raid-devices=4 /dev/sd{b,c,d,e}
# Добавляем диск под hotspare
sudo mdadm --add /dev/md0 /dev/sdf

# Ожидание завершения ссоздания и готовности метадевайса
echo -e "\nWaiting for metadevice creation 60s..."
sleep 60
# Можно в цикле отслеживать greep-ом статус готовности (синхронизации) метадевайса, но мне лень :)

# Создаем таблицу разделов GPT 
sudo parted -s /dev/md0 mklabel gpt

# Создаем 5 разделов
sudo parted /dev/md0 mkpart primary ext4 0% 20%
sudo parted /dev/md0 mkpart primary ext4 20% 40%
sudo parted /dev/md0 mkpart primary ext4 40% 60%
sudo parted /dev/md0 mkpart primary ext4 60% 80%
sudo parted /dev/md0 mkpart primary ext4 80% 100%

# Создаем ФС и монтируем
for i in $(seq 1 5); do sudo mkfs.ext4 /dev/md0p$i; done
mkdir -p /raid/part{1,2,3,4,5}
for i in $(seq 1 5); do mount /dev/md0p$i /raid/part$i; done

# Добавление строки монтирования в fstab
for i in $(seq 1 5); do echo "/dev/md0p$i /raid/part$i ext4 defaults 0 0" | sudo tee -a /etc/fstab ; done

# Вывод для информации
df -hT
sudo mdadm -D /dev/md0