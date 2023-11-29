# Домашнее задание 5. ZFS

## Что нужно сделать.

1. Определить алгоритм с наилучшим сжатием.
2. Определить настройки pool’a.
3. Снапшот. Найти сообщение от преподавателей.

Что имеем: DV с 6 блочными устройствами (дисками), описанный через Vagrantfile 

Запускаем ВМ

```
vargant up
vagrant provision
vagrant ssh
```

Большинство команд требуют root полномочия, дальнейшие команды выполняем из под root
`sudo -i`

```bash
lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda      8:0    0   40G  0 disk
└─sda1   8:1    0   40G  0 part /
sdb      8:16   0  512M  0 disk
sdc      8:32   0  512M  0 disk
sdd      8:48   0  512M  0 disk
sde      8:64   0  512M  0 disk
sdf      8:80   0  512M  0 disk
sdg      8:96   0  512M  0 disk
sdh      8:112  0  512M  0 disk
sdi      8:128  0  512M  0 disk
```

# Решение

### 1. Определить алгоритм с наилучшим сжатием.

```bash
# Создаем 4 пула RAIDZ1

zpool create otus1 mirror /dev/sd{b,c}
zpool create otus2 mirror /dev/sd{d,e}
zpool create otus3 mirror /dev/sd{f,g}
zpool create otus4 mirror /dev/sd{h,i}

zpool list
NAME    SIZE  ALLOC   FREE  CKPOINT  EXPANDSZ   FRAG    CAP  DEDUP    HEALTH  ALTROOT
otus1   480M  91.5K   480M        -         -     0%     0%  1.00x    ONLINE  -
otus2   480M  91.5K   480M        -         -     0%     0%  1.00x    ONLINE  -
otus3   480M  91.5K   480M        -         -     0%     0%  1.00x    ONLINE  -
otus4   480M  91.5K   480M        -         -     0%     0%  1.00x    ONLINE  -

# Устанавливаем разные алгоритмы сжатия
zfs set compression=lzjb otus1
zfs set compression=lz4 otus2
zfs set compression=gzip-9 otus3
zfs set compression=zle otus4

zfs get all | grep compression
otus1  compression           lzjb                   local
otus2  compression           lz4                    local
otus3  compression           gzip-9                 local
otus4  compression           zle                    local

# Загружаем текстовый файл на все пулы
for i in {1..4}; do wget -P /otus$i https://gutenberg.org/cache/epub/2600/pg2600.converter.log; done

# Проверяем
ls -l /otus*
/otus1:
total 22061
-rw-r--r--. 1 root root 40988863 Nov  2 08:10 pg2600.converter.log

/otus2:
total 17991
-rw-r--r--. 1 root root 40988863 Nov  2 08:10 pg2600.converter.log

/otus3:
total 10958
-rw-r--r--. 1 root root 40988863 Nov  2 08:10 pg2600.converter.log

/otus4:
total 40057
-rw-r--r--. 1 root root 40988863 Nov  2 08:10 pg2600.converter.log

zfs list
NAME    USED  AVAIL     REFER  MOUNTPOINT
otus1  21.6M   330M     21.6M  /otus1
otus2  17.7M   334M     17.6M  /otus2
otus3  10.8M   341M     10.7M  /otus3
otus4  39.2M   313M     39.1M  /otus4

# Поверяем текущий уровень компрессии данных на пулах
zfs get all | grep compressratio | grep -v ref
otus1  compressratio         1.81x                  -
otus2  compressratio         2.22x                  -
otus3  compressratio         3.65x                  -
otus4  compressratio         1.00x                  -
```

Наилучшее сжатие данных (текстовых) показал gzip.

### Определить настройки pool’a.

```bash
# Скачиваем архив
wget -O archive.tar.gz --no-check-certificate 'https://drive.google.com/u/0/uc?id=1KRBNW33QWqbvbVHa3hLJivOAt60yukkg&export=download'

# Распаковываем
tar -xzvf archive.tar.gz
zpoolexport/
zpoolexport/filea
zpoolexport/fileb

# Получаем информацию о пуле
zpool import -d zpoolexport/
   pool: otus
     id: 6554193320433390805
  state: ONLINE
 action: The pool can be imported using its name or numeric identifier.
 config:

        otus                         ONLINE
          mirror-0                   ONLINE
            /root/zpoolexport/filea  ONLINE
            /root/zpoolexport/fileb  ONLINE

# Импортируем пул в нашу систему
zpool import -d zpoolexport/ otus
zpool list
NAME    SIZE  ALLOC   FREE  CKPOINT  EXPANDSZ   FRAG    CAP  DEDUP    HEALTH  ALTROOT
otus    480M  2.21M   478M        -         -     0%     0%  1.00x    ONLINE  -
otus1   480M  21.7M   458M        -         -     0%     4%  1.00x    ONLINE  -
otus2   480M  17.7M   462M        -         -     0%     3%  1.00x    ONLINE  -
otus3   480M  10.8M   469M        -         -     0%     2%  1.00x    ONLINE  -
otus4   480M  39.2M   441M        -         -     0%     8%  1.00x    ONLINE  -

# Настройки пула
zpool get all otus
NAME  PROPERTY                       VALUE                          SOURCE
otus  size                           480M                           -
otus  capacity                       0%                             -
otus  altroot                        -                              default
...
otus  feature@bookmark_v2            enabled                        local

# Настройки файловой системы
zfs get all otus
NAME  PROPERTY              VALUE                  SOURCE
otus  type                  filesystem             -
otus  creation              Fri May 15  4:00 2020  -
...
otus  special_small_blocks  0                      default
```

### 3. Снапшот. Найти сообщение от преподавателей.

```bash
# Скачиваем указанный в задании файл
wget -O otus_task2.file --no-check-certificate "https://drive.google.com/u/0/uc?id=1gH8gCL9y7Nd5Ti3IRmplZPF1XjzxeRAG&export=download"

# Восстанавливаем файловую систему из снапшота: 
zfs receive otus/test@today < otus_task2.file

# ищем в каталоге /otus/test файл с именем “secret_message”
find /otus/test -name "secret_message"
/otus/test/task1/file_mess/secret_message

Читаем найденый файл
cat /otus/test/task1/file_mess/secret_message
https://github.com/sindresorhus/awesome
```