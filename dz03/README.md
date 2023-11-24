# Домашнее задание 3. mdadm

## Что нужно сделать?

- добавить в Vagrantfile еще дисков;
- сломать/починить raid;
- собрать R0/R5/R10 на выбор;
- прописать собранный рейд в конф, чтобы рейд собирался при загрузке;
- создать GPT раздел и 5 партиций.
- На проверку отправьте измененный Vagrantfile, скрипт для создания рейда, конф для автосборки рейда при загрузке.

### Доп. задание*

Vagrantfile, который сразу собирает систему с подключенным рейдом и смонтированными разделами. После перезагрузки стенда разделы должны автоматически примонтироваться.

### Задание повышенной сложности**

перенести работающую систему с одним диском на RAID 1. Даунтайм на загрузку с нового диска предполагается. На проверку отправьте вывод команды lsblk до и после и описание хода решения (можно воспользоваться утилитой Script).

# Решение

- Vagrantfile с 5-ю доп. дисками и пакетами программ для работы с дисками: mdadm smartmontools hdparm gdisk
    
    ```ruby
    # -*- mode: ruby -*-
    # vim: set ft=ruby :
    
    MACHINES = {
        :otuslinux => {
            :box_name => "centos/7",
            :ip_addr => '192.168.56.101',
            :disks => {
                :sata1 => {
                    :dfile => './sata1.vdi',
                    :size => 250,
                    :port => 1
                },
                :sata2 => {
                    :dfile => './sata2.vdi',
                    :size => 250,
                    :port => 2
                },
                :sata3 => {
                    :dfile => './sata3.vdi',
                    :size => 250,
                    :port => 3
                },
                :sata4 => {
                    :dfile => './sata4.vdi',
                    :size => 250,
                    :port => 4
                },
                :sata5 => {
                    :dfile => './sata5.vdi',
                    :size => 250,
                    :port => 5
                }
            }
        },
    }
    
    Vagrant.configure("2") do |config|
    
      MACHINES.each do |boxname, boxconfig|
    
          config.vm.define boxname do |box|
    
              box.vm.box = boxconfig[:box_name]
              box.vm.host_name = boxname.to_s
              box.vm.network "private_network", ip: boxconfig[:ip_addr]
    
              box.vm.provider :virtualbox do |vb|
                	  vb.customize ["modifyvm", :id, "--memory", "1024"]
                      needsController = false
    		  boxconfig[:disks].each do |dname, dconf|
    			  unless File.exist?(dconf[:dfile])
    				vb.customize ['createhd', '--filename', dconf[:dfile], '--variant', 'Fixed', '--size', dconf[:size]]
                                    needsController =  true
                              end
    		  end
                      if needsController == true
                         vb.customize ["storagectl", :id, "--name", "SATA", "--add", "sata" ]
                         boxconfig[:disks].each do |dname, dconf|
                             vb.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', dconf[:port], '--device', 0, '--type', 'hdd', '--medium', dconf[:dfile]]
                         end
                      end
              end
     	  box.vm.provision "shell", inline: <<-SHELL
    	      mkdir -p ~root/.ssh
              cp ~vagrant/.ssh/auth* ~root/.ssh
    	      yum install -y mdadm smartmontools hdparm gdisk
      	  SHELL
          end
      end
    end
    ```
    
- Сборка RAID10 с hotspare диском.
    
    Есть 5 дисков /dev/sd[b-f]
    
    ```ruby
    lsblk
    NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
    sda      8:0    0   40G  0 disk
    └─sda1   8:1    0   40G  0 part /
    sdb      8:16   0  250M  0 disk
    sdc      8:32   0  250M  0 disk
    sdd      8:48   0  250M  0 disk
    sde      8:64   0  250M  0 disk
    sdf      8:80   0  250M  0 disk
    ```
    
    Обнуляем суперблоки (на случай, если какие-то диски уже были в массивах):
    
    `sudo mdadm --zero-superblock --force /dev/sd{b,c,d,e,f}`
    
    Создаем массив RAID10 из 4х дисков
    
    `sudo mdadm --create --verbose /dev/md0 --level=10 --raid-devices=4 /dev/sd{b,c,d,e}`
    
    Добавляем диск под hotspare
    
    `sudo mdadm --add /dev/md0 /dev/sdf`
    
    Проверяем статус
    
    ```ruby
    sudo cat /proc/mdstat
    Personalities : [raid6] [raid5] [raid4] [raid10] 
    md0 : active raid10 sde[3] sdd[2] sdc[1] sdb[0]
          507904 blocks super 1.2 512K chunks 2 near-copies [4/4] [UUUU]
          [===>.................]  resync = 18.8% (96000/507904) finish=0.4min speed=16000K/sec   
    
    unused devices: <none>
    ```
    
    Ждем конца синхронизации
    
    ```bash
    sudo mdadm -D /dev/md0
    /dev/md0:
               Version : 1.2
         Creation Time : Fri Nov 24 16:04:55 2023
            Raid Level : raid10
            Array Size : 507904 (496.00 MiB 520.09 MB)
         Used Dev Size : 253952 (248.00 MiB 260.05 MB)
          Raid Devices : 4
         Total Devices : 5
           Persistence : Superblock is persistent
    
           Update Time : Fri Nov 24 16:19:02 2023
                 State : clean
        Active Devices : 4
       Working Devices : 5
        Failed Devices : 0
         Spare Devices : 1
    
                Layout : near=2
            Chunk Size : 512K
    
    Consistency Policy : resync
    
                  Name : localhost.localdomain:0  (local to host localhost.localdomain)
                  UUID : d68ff31f:3b2fc0b5:c84bd04e:294204dc
                Events : 18
    
        Number   Major   Minor   RaidDevice State
           0       8       16        0      active sync set-A   /dev/sdb
           1       8       32        1      active sync set-B   /dev/sdc
           2       8       48        2      active sync set-A   /dev/sdd
           3       8       64        3      active sync set-B   /dev/sde
    
           4       8       80        -      spare   /dev/sdf
    ```
    
    Проверяем корректность информации по массиву
    
    ```bash
    sudo mdadm --detail --scan --verbose
    ARRAY /dev/md0 level=raid10 num-devices=4 metadata=1.2 spares=1 name=localhost.localdomain:0 UUID=d68ff31f:3b2fc0b5:c84bd04e:294204dc
       devices=/dev/sdb,/dev/sdc,/dev/sdd,/dev/sde,/dev/sdf
    ```
    
    Сохраняем конфигурацию в /etc/mdadm/mdadm.conf
    
    ```ruby
    sudo echo "DEVICE partitions" > /etc/mdadm/mdadm.conf
    sudo mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf
    ```
    
    Создаем ФС и монтируем
    
    Создаем таблицу разделов GPT на RAID.

    `parted -s /dev/md0 mklabel gpt`

    Создаём разделы на массиве:

    
    ```bash
    parted /dev/md0 mkpart primary ext4 0% 20%
    parted /dev/md0 mkpart primary ext4 20% 40%
    parted /dev/md0 mkpart primary ext4 40% 60%
    parted /dev/md0 mkpart primary ext4 60% 80%
    parted /dev/md0 mkpart primary ext4 80% 100%
    ```
    
    Далее можно создать на этих разделах файловые системы

    `for i in $(seq 1 5); do sudo mkfs.ext4 /dev/md0p$i; done`
    И смонтировать их по каталогам:

    `mkdir -p /raid/part{1,2,3,4,5}
     for i in $(seq 1 5); do mount /dev/md0p$i /raid/part$i; done`
    
    Чтобы автоматически монтировать эти разделы при каждом запуске, добавляем записи в файл /etc/fstab:
    
    `for i in $(seq 1 5); do echo "/dev/md0p$i /raid/part$i ext4 defaults 0 0" | sudo tee -a /etc/fstab ; done`
    
    ### Имитация поломки диска
    
    Начальное состояние см. выше
    
    ```bash
    cat /proc/mdstat
    Personalities : [raid6] [raid5] [raid4] [raid10] 
    md0 : active raid10 sdf[4](S) sde[3] sdd[2] sdc[1] sdb[0]
          507904 blocks super 1.2 512K chunks 2 near-copies [4/4] [UUUU]
    
    unused devices: <none>
    ```
    
    Помечаем один из дисков как fail
    
    `mdadm /dev/md0 --fail /dev/sde`
    
    Видим, что проблемный диск был заменен hotspare диском и выполняется синхронизация
    
    ```bash
    cat /proc/mdstat
    Personalities : [raid6] [raid5] [raid4] [raid10] 
    md0 : active raid10 sdf[4] sde[3](F) sdd[2] sdc[1] sdb[0]
          507904 blocks super 1.2 512K chunks 2 near-copies [4/3] [UUU_]
          [====>................]  recovery = 22.7% (58112/253952) finish=0.1min speed=19370K/sec
    
    unused devices: <none>
    [vagrant@localhost ~]$ sudo mdadm -D /dev/md0
    /dev/md0:
               Version : 1.2
         Creation Time : Fri Nov 24 16:04:55 2023
            Raid Level : raid10
            Array Size : 507904 (496.00 MiB 520.09 MB)
         Used Dev Size : 253952 (248.00 MiB 260.05 MB)
          Raid Devices : 4
         Total Devices : 5
           Persistence : Superblock is persistent
    
           Update Time : Fri Nov 24 16:30:39 2023
                 State : clean, degraded, recovering
        Active Devices : 3
       Working Devices : 4
        Failed Devices : 1
         Spare Devices : 1
    
                Layout : near=2
            Chunk Size : 512K
    
    Consistency Policy : resync
    
        Rebuild Status : 72% complete
    
                  Name : localhost.localdomain:0  (local to host localhost.localdomain)
                  UUID : d68ff31f:3b2fc0b5:c84bd04e:294204dc
                Events : 31
    
        Number   Major   Minor   RaidDevice State
           0       8       16        0      active sync set-A   /dev/sdb
           1       8       32        1      active sync set-B   /dev/sdc
           2       8       48        2      active sync set-A   /dev/sdd
           4       8       80        3      spare rebuilding   /dev/sdf
    
           3       8       64        -      faulty   /dev/sde
    ```
    
    Извлекаем диск
    
    `sudo mdadm /dev/md0 --remove /dev/sde`
    
    Поменяли и вставляем новый диск
    
    `sudo mdadm /dev/md0 --add /dev/sde`
    
    Видим, что диск в нормальном состоянии и остается на позиции hotspare
    
    ```bash
    sudo mdadm -D /dev/md0
    ...
    5       8       64        -      spare   /dev/sde
    ```
    
- Итоговый Vagrantfile и скрипт provision.sh
    
    Vagrantfile:
    
    ```ruby
    # -*- mode: ruby -*-
    # vim: set ft=ruby :
    
    MACHINES = {
        :otuslinux => {
            :box_name => "centos/7",
            :ip_addr => '192.168.56.101',
            :disks => {
                :sata1 => {
                    :dfile => './sata1.vdi',
                    :size => 250,
                    :port => 1
                },
                :sata2 => {
                    :dfile => './sata2.vdi',
                    :size => 250,
                    :port => 2
                },
                :sata3 => {
                    :dfile => './sata3.vdi',
                    :size => 250,
                    :port => 3
                },
                :sata4 => {
                    :dfile => './sata4.vdi',
                    :size => 250,
                    :port => 4
                },
                :sata5 => {
                    :dfile => './sata5.vdi',
                    :size => 250,
                    :port => 5
                }
            }
        },
    }
    
    Vagrant.configure("2") do |config|
    
      MACHINES.each do |boxname, boxconfig|
    
          config.vm.define boxname do |box|
    
              box.vm.box = boxconfig[:box_name]
              box.vm.host_name = boxname.to_s
              box.vm.network "private_network", ip: boxconfig[:ip_addr]
    
              box.vm.provider :virtualbox do |vb|
                	  vb.customize ["modifyvm", :id, "--memory", "1024"]
                      needsController = false
    		  boxconfig[:disks].each do |dname, dconf|
    			  unless File.exist?(dconf[:dfile])
    				vb.customize ['createhd', '--filename', dconf[:dfile], '--variant', 'Fixed', '--size', dconf[:size]]
                                    needsController =  true
                              end
    		  end
                      if needsController == true
                         vb.customize ["storagectl", :id, "--name", "SATA", "--add", "sata" ]
                         boxconfig[:disks].each do |dname, dconf|
                             vb.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', dconf[:port], '--device', 0, '--type', 'hdd', '--medium', dconf[:dfile]]
                         end
                      end
              end
     	  box.vm.provision "shell", path: "provision.sh"
          end
      end
    end
    ```
    
    Скрипт provision.sh:
    
    ```bash
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
    ```