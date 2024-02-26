# Домашнее задание 17. Backup

## Задание

Настроить стенд Vagrant с двумя виртуальными машинами: backup_server и client. (Студент самостоятельно настраивает Vagrant)

Настроить удаленный бэкап каталога /etc c сервера client при помощи borgbackup. Резервные копии должны соответствовать следующим критериям:

- директория для резервных копий /var/backup. Это должна быть отдельная точка монтирования. В данном случае для демонстрации размер не принципиален, достаточно будет и 2GB; (Студент самостоятельно настраивает)
- репозиторий для резервных копий должен быть зашифрован ключом или паролем - на ваше усмотрение;
- имя бэкапа должно содержать информацию о времени снятия бекапа;
- глубина бекапа должна быть год, хранить можно по последней копии на конец месяца, кроме последних трех. Последние три месяца должны содержать копии на каждый день. Т.е. должна быть правильно настроена политика удаления старых бэкапов;
- резервная копия снимается каждые 5 минут. Такой частый запуск в целях демонстрации;
- написан скрипт для снятия резервных копий. Скрипт запускается из соответствующей Cron джобы, либо systemd timer-а - на ваше усмотрение;
- настроено логирование процесса бекапа. Для упрощения можно весь вывод перенаправлять в logger с соответствующим тегом. Если настроите не в syslog, то обязательна ротация логов.

# Решение

Т.к. мой процессор не поддерживает Intel VT-x, то используем схему с 3 хостами: server, client, ansible

### Некоторое отступление

В настоящее время сталкиваюсь с ошибкой при запуске ВМ - vagrant не может прокинуть каталог проекта в домашнюю директорию пользователя vagrant:

```ruby
==> ansible: Configuring and enabling network interfaces...
==> ansible: Rsyncing folder: /cygdrive/g/OTUS/dz17/ => /vagrant
There was an error when attempting to rsync a synced folder.
Please inspect the error message below for more info.

Host path: /cygdrive/g/OTUS/dz17/
Guest path: /vagrant
Command: "rsync" "--verbose" "--archive" "--delete" "-z" "--copy-links" "--chmod=ugo=rwX" "--no-perms" "--no-owner" "--no-group" "--rsync-path" "sudo rsync" "-e" "ssh -p 2201 -o LogLevel=FATAL    -o IdentitiesOnly=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i 'G:/OTUS/dz17/.vagrant/machines/ansible/virtualbox/private_key'" "--exclude" ".vagrant/" "/cygdrive/g/OTUS/dz17/" "vagrant@127.0.0.1:/vagrant"
Error: vagrant@127.0.0.1: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
rsync: connection unexpectedly closed (0 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at io.c(231) [sender=3.2.7]
```

Данная ошибка прерывает выполнение скриптов из раздела provision
Однозначного решения этой проблемы не найдено.  Для предотвращения этой ошибки отключаем проброс директории в Vagrantfile:

```ruby
config.vm.synced_folder ".", "/vagrant", disabled: true
```

---

## Подготовка стенда

В результате получим 3 хоста: 

**backup** - сервер бэкапов с дополнительным диском на 2Gb

**client** - хост, данные с которого требуется бэкапить

**ansible** - хост управления c установленным Ansible и playbooks для настройки хостов backup и client

Запускаем `vagrant up`. 

[Log запуска хостов](https://www.notion.so/Log-12715c58bfe04085b839a4c9a01bf5ce?pvs=21)

Подключаемся к хосту **ansible**, создаем ssh-key и прокидываем его на хосты.

```bash
**vagrant ssh ansible**

# Выполняем под пользователем vagrant
**ssh-keygen**
Generating public/private rsa key pair.
Enter file in which to save the key (/home/vagrant/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again:
Your identification has been saved in /home/vagrant/.ssh/id_rsa.
Your public key has been saved in /home/vagrant/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:gSV0yHlxSFC1gzGeWOF/XQt5oa60Rk9iB/zQvGuld3s vagrant@ansible
The key's randomart image is:
+---[RSA 2048]----+
|     o+*@=o    . |
|      +Xo*..o o .|
|      o.* o+ * ..|
|         o .=.+..|
|        S .=.*.o |
|          +.B +  |
|           + = ..|
|          . . . E|
|               ..|
+----[SHA256]-----+

# Копируем ключ на хост backup
**ssh-copy-id vagrant@192.168.11.160**

# Копируем ключ на хост client
**ssh-copy-id vagrant@192.168.11.150**
```

Установка ПО borg на хосты client и backup 

```bash
**ansible-playbook ./playbooks/borg.yml -i ./inventories/hosts** 

PLAY [all] *********************************************************************************************************************
TASK [Ping server] *************************************************************************************************************
ok: [192.168.11.160]
ok: [192.168.11.150]

TASK [Install epel-release] ****************************************************************************************************
changed: [192.168.11.160]
changed: [192.168.11.150]

TASK [Install borgbackup] ******************************************************************************************************
changed: [192.168.11.160]
changed: [192.168.11.150]

PLAY RECAP *********************************************************************************************************************
192.168.11.150             : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
192.168.11.160             : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

Подготовка хоста backup в качестве сервера для бэкапов

```bash
**ansible-playbook ./playbooks/backup.yml -i ./inventories/hosts**

PLAY [backup] *****************************************************************************************************************  
                                                                                                                                                                                                                 ok
TASK [Ping server] ************************************************************************************************************
ok: [192.168.11.160]
                                                                                                                                                                                                                 ch
TASK [Create new partition] ***************************************************************************************************
changed: [192.168.11.160]
                                                                                                                                                                                                                 ch
TASK [Create ext4 filesystem on /dev/sdb1] ************************************************************************************
changed: [192.168.11.160]
                                                                                                                                                                                                                 ch
TASK [Create user Borg] *******************************************************************************************************
changed: [192.168.11.160]
                                                                                                                                                                                                                 ch
TASK [Create directory /var/backup] *******************************************************************************************
changed: [192.168.11.160]
                                                                                                                                                                                                                 ch
TASK [Mount sdb1 to /var/backup] **********************************************************************************************
changed: [192.168.11.160]
                                                                                                                                                                                                                 ch
TASK [Create directory /home/borg/.ssh] ***************************************************************************************
changed: [192.168.11.160]
                                                                                                                                                                                                                 ch
TASK [Create file authorized_keys in borg homedirectory] **********************************************************************
changed: [192.168.11.160]
                                                                                                                                                                                                                 19
PLAY RECAP ********************************************************************************************************************
192.168.11.160             : ok=8    changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

Хосты подготовлены.

## Настройка backup

Действия на хосте **backup**

```bash
**vagrant ssh backup**

# Задаем пароль *borg* для пользователя borg
**sudo passwd borg**
```

Действия на хосте **client**

```bash
**vagrant ssh client**

**sudo -i

ssh-keygen**

# Передаем ключ на хост backup используя вышезаданный пароль
**ssh-copy-id borg@192.168.11.160**
```

Инициализируем репозиторий на сервере **backup** с хоста **client**  (для защиты задаём пароль "borg")

> Почему использую директорию **/var/backup/client_data/**, а не **/var/backup/** как в методичке. Оказывается, при инициализации хранилища система сообщает, что не может этого сделать, т.к. в директории что-то есть. Это что-то - это служебная директория last+found 🤷‍♂️
> 

```bash
**borg init --encryption=repokey borg@192.168.11.160:/var/backup/client_data/**
Enter new passphrase: 
Enter same passphrase again:
Do you want your passphrase to be displayed for verification? [yN]: y
Your passphrase (between double-quotes): "borg"
Make sure the passphrase displayed above is exactly what you wanted.

By default repositories initialized with this version will produce security
errors if written to with an older version (up to and including Borg 1.0.8).

If you want to use these older versions, you can disable the check by running:
borg upgrade --disable-tam ssh://borg@192.168.11.160/var/backup/client_data

See https://borgbackup.readthedocs.io/en/stable/changes.html#pre-1-0-9-manifest-spoofing-vulnerability for details about the security implications.

IMPORTANT: you will need both KEY AND PASSPHRASE to access this repo!
If you used a repokey mode, the key is stored in the repo, but you should back it up separately.
Use "borg key export" to export the key, optionally in printable format.
Write down the passphrase. Store both at safe place(s).
```

Получаем и сохраняем ключ репозитория

```bash
borg key export borg@192.168.11.160:/var/backup/client_data/
BORG_KEY f9a092be3bef660f9ca504a9f3acd9e3529c68b1d8230bcc73bb1d2289fe349c
hqlhbGdvcml0aG2mc2hhMjU2pGRhdGHaAN6Bydr/3wnmBjTGaoz0V0KFm7jyeLvqI1SPJe
Lh2SRrdCsJlvee3kQlzgeS5pRACjqA9DADzpbGgsqMCeJ9mFjWnB7tR3XjtDuw0YWtXbS2
TG/arDq3xiyb/HHg2PB3LKlvdGIo3WVvRpMasUftiIWbn5KJoFVcIHjLXi7gOzhPtwsAmV
Wf2m/RE9UB3ZEaQZQ0X+SOKu4FLA3rVL3PIclxBcGw1lx/RpPSAzlybQJu4lAyK5QWp/GU
0w//TOu6GJ7jIdChsgGkDaDw80vlruXCNCzYnkGTtc4OXlAluOekaGFzaNoAICWe9cLgi7
BQywu2v3lydQeVZ/DffosU4Pw3glkjRc4kqml0ZXJhdGlvbnPOAAGGoKRzYWx02gAg+buv
J0bVHumEKTdK9b41G46VsF/Eb6wxO2cigeUNU3WndmVyc2lvbgE=
```

Так же его можно увидеть в /var/backup/client_data/config

Запускаем создание бэкапа папки /etc

```bash
borg create --stats --list borg@192.168.11.160:/var/backup/client_data/::"etc-{now:%Y-%m-%d_%H:%M:%S}" /etc
...
d /etc/audit
A /etc/sudoers.d/vagrant
d /etc/sudoers.d
d /etc
------------------------------------------------------------------------------
Archive name: etc-2024-02-25_13:07:21
Archive fingerprint: 5d81e64b75f5f635e1991df18751f4291e7b1fc1dd057e92b816f216efa263d3
Time (start): Sun, 2024-02-25 13:07:29
Time (end):   Sun, 2024-02-25 13:07:37
Duration: 8.25 seconds
Number of files: 1698
Utilization of max. archive size: 0%
------------------------------------------------------------------------------
                       Original size      Compressed size    Deduplicated size
This archive:               28.43 MB             13.49 MB             11.84 MB
All archives:               28.43 MB             13.49 MB             11.84 MB

                       Unique chunks         Total chunks
Chunk index:                    1277                 1692
------------------------------------------------------------------------------
```

Проверяем

```bash
# Что есть в бэкапе
**borg list borg@192.168.11.160:/var/backup/client_data/**
Enter passphrase for key ssh://borg@192.168.11.160/var/backup/client_data: 
etc-2024-02-25_13:07:21              Sun, 2024-02-25 13:07:29 [5d81e64b75f5f635e1991df18751f4291e7b1fc1dd057e92b816f216efa263d3]

# Список файлов 
**borg list borg@192.168.11.160:/var/backup/client_data/::etc-2024-02-25_13:07:21**
...
-rw-r----- root   root        127 Thu, 2019-08-08 12:06:02 etc/audit/audit-stop.rules
-rw-r----- root   root        805 Thu, 2019-08-08 12:06:02 etc/audit/auditd.conf
drwxr-x--- root   root          0 Thu, 2020-04-30 22:09:26 etc/sudoers.d
-r--r----- root   root         33 Thu, 2020-04-30 22:09:26 etc/sudoers.d/vagrant

# Пробуем достать файлы из бэкапа
**borg extract borg@192.168.11.160:/var/backup/client_data/::etc-2024-02-25_13:07:21 etc/yum**
Enter passphrase for key ssh://borg@192.168.11.160/var/backup/client_data:

**ls -l ./etc**
total 0
drwxr-xr-x. 6 root root 100 Apr 30  2020 yum
```

### Автоматизация backup-ов

Подключаемся к хосту **client**

```bash
**vagrant ssh client

sudo -i**
```

Создаем сервис-файл для backup-а

```bash
**tee <<EOF >/dev/null /etc/systemd/system/borg-backup.service
[Unit]
Description=Borg Backup

[Service]
Type=oneshot

# Пароль
Environment="BORG_PASSPHRASE=borg"
# Репозиторий
Environment="REPO=borg@192.168.11.160:/var/backup/client_data/"
# Что бэкапим
Environment="BACKUP_TARGET=/etc"
# Создание бэкапа
ExecStart="/bin/borg create --stats \${REPO}::{hostname}-{user}-{now:%Y-%m-%d_%H:%M:%S} \${BACKUP_TARGET}"
# Проверка бэкапа
ExecStart="/bin/borg check \${REPO}"
# Очистка старых бэкапов
ExecStart="/bin/borg prune --keep-daily 90 --keep-monthly 12 --keep-yearly 1 \${REPO}"
EOF**
```

Создаем borg-backup.timer, который будет запускать borg-backup.service каждые 5 минут

```bash
**tee <<EOF >/dev/null /etc/systemd/system/borg-backup.timer
[Unit]
Description=Borg Backup
Requires=borg-backup.service

[Timer]
Unit=borg-backup.service
OnUnitActiveSec=5min

[Install]
WantedBy=timers.target
EOF**
```

Включаем и запускаем службу таймера

```bash
**systemctl enable borg-backup.timer 

systemctl start borg-backup.timer**
```

Проверяем работу таймера

```bash
**systemctl list-timers --all**
NEXT                         LEFT          LAST                         PASSED       UNIT                         ACTIVATES
Mon 2024-02-26 08:40:26 UTC  2min 44s left Mon 2024-02-26 08:35:26 UTC  2min 15s ago borg-backup.timer            borg-backup.service
Tue 2024-02-27 06:00:44 UTC  21h left      Mon 2024-02-26 06:00:44 UTC  2h 36min ago systemd-tmpfiles-clean.timer systemd-tmpfiles-clean.service
n/a                          n/a           n/a                          n/a          systemd-readahead-done.timer systemd-readahead-done.service

3 timers listed.
```

Проверяем что бэкапы создаются

```bash
**borg list borg@192.168.11.160:/var/backup/client_data/**
Enter passphrase for key ssh://borg@192.168.11.160/var/backup/client_data:
etc-2024-02-26_06:41:43              Mon, 2024-02-26 06:41:52 [c8f9150238b808789f3eed188c8012ee29d8bbdb67ff88072d19405d3d788cf8]
client-root-2024-02-26_08:24:03      Mon, 2024-02-26 08:24:20 [b9629ef69801a0efa9edcfd2837f8f2c0c8f643e8e30520a1e54ad13e1eae2d4]
client-root-2024-02-26_08:29:52      Mon, 2024-02-26 08:30:02 [1560b6791ff51691d36ab9fabd1ad399b3517b6bcb2e1077dcdbcc0069aa02f1]
client-root-2024-02-26_08:35:27      Mon, 2024-02-26 08:35:37 [31c0408fc39da1ede0f956dea7562e350a8b930dc2470aa535223cafd8223be2]
```

---