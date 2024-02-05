# Домашнее задание 15. PAM

## Задание


- Запретить всем пользователям, кроме группы admin, логин в выходные (суббота и воскресенье), без учета праздников

- * дать конкретному пользователю права работать с докером и возможность рестартить докер сервис

**Цель:**

Научиться создавать пользователей и добавлять им ограничения

# Решение

[Vagrantfile](Vagrantfile)

Запускаем ВМ и подключаемся к ней

```bash
vagrant up
vagrant ssh
sudo -i
```

Создаем пользователей и задаем пароли

```bash
useradd otusadm && useradd otus
echo "Otus2022" | passwd --stdin otusadm && echo "Otus2022" | passwd --stdin otus
Changing password for user otusadm.
passwd: all authentication tokens updated successfully.
Changing password for user otus.
passwd: all authentication tokens updated successfully.
```

Создаем группу admin и назначаем ее пользователям

```bash
groupadd -f admin
usermod otusadm -a -G admin && usermod root -a -G admin && usermod vagrant -a -G admin
# Проверим
cat /etc/group|grep admin
printadmin:x:997:
admin:x:1003:otusadm,root,vagrant
```

Проверяем возможность подключения пользователя

```bash
ssh otus@10.0.2.15
The authenticity of host '10.0.2.15 (10.0.2.15)' can't be established.
ECDSA key fingerprint is SHA256:y5BZvnqXFYT0j+b3Ggo8znFpLLj4skOOCI/tN9h+N/A.
ECDSA key fingerprint is MD5:74:be:98:fc:f0:a3:f3:ec:9c:be:a2:0d:fc:53:c7:3a.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.0.2.15' (ECDSA) to the list of known hosts.
otus@10.0.2.15's password: 

[otus@localhost ~]$ id
uid=1002(otus) gid=1002(otus) groups=1002(otus) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
```

Пользователь otus может подключаться.

Создадим файл-скрипт /usr/local/bin/login.sh

```bash
#!/bin/bash
#Первое условие: если день недели суббота или воскресенье
if [ $(date +%a) = "Sat" ] || [ $(date +%a) = "Sun" ]; then
 #Второе условие: входит ли пользователь в группу admin
 if getent group admin | grep -qw "$PAM_USER"; then
        #Если пользователь входит в группу admin, то он может подключиться
        exit 0
      else
        #Иначе ошибка (не сможет подключиться)
        exit 1
    fi
  #Если день не выходной, то подключиться может любой пользователь
  else
    exit 0
fi
```

Добавим права на исполнение файла

```bash
chmod +x /usr/local/bin/login.sh
```

Укажем в файле /etc/pam.d/sshd модуль pam_exec и наш скрипт дописав строку

`auth required pam_exec.so /usr/local/bin/login.sh`

Проверяем

```bash
ssh otus@10.0.2.15
otus@10.0.2.15's password: 
Last login: Mon Feb  5 13:03:54 2024 from 10.0.2.15
logout
Connection to 10.0.2.15 closed.
# Успешно подключился
```

Меняем дату

```bash
date --set="2024-02-04 12:30:00"
Sun Feb  4 12:30:00 UTC 2024
```

Проверяем подключение под пользователем otus

```bash
ssh otus@10.0.2.15
otus@10.0.2.15's password: 
Permission denied, please try again.
otus@10.0.2.15's password:
# Не дает подключиться
```

Проверяем подключение под пользователем otusadm

```bash
ssh otusadm@10.0.2.15
otusadm@10.0.2.15's password: 
[otusadm@localhost ~]$ whoami
otusadm
# Успешное подключение
[otusadm@localhost ~]$ date
Sun Feb  4 12:33:07 UTC 2024
```

### Дополнительное задание

дать конкретному пользователю права работать с докером и возможность рестартить докер сервис

### Решение

Установим докер

```bash
yum install docker
...
systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)        
   Active: inactive (dead)
     Docs: http://docs.docker.com

systemctl start docker

systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)        
   Active: active (running) since Sun 2024-02-04 12:36:40 UTC; 2s ago
...
systemctl enable docker
```

Проверим пользователя otusadm

```bash
ssh otusadm@10.0.2.15
otusadm@10.0.2.15's password: 
Last login: Sun Feb  4 12:31:13 2024 from 10.0.2.15
[otusadm@localhost ~]$ docker ps -a
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.26/containers/json?all=1: dial unix /var/run/docker.sock: connect: permission denied
# Нет прав
```

Добавляем пользователя в группу

```bash
cat /etc/group|grep docker
dockerroot:x:993:

sudo usermod -aG dockerroot otusadm

cat /etc/group|grep docker
dockerroot:x:993:otusadm
```

```bash
su - otusadm
Last login: Mon Feb  5 13:55:54 UTC 2024 on pts/0

[otusadm@localhost ~]$ docker ps -a
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.26/containers/json?all=1: dial unix /var/run/docker.sock: connect: permission denied
```

Но пользователь все равно не может подключится и управлять docker-ом, т.к. доступ к /var/run/docker.sock имеет только root.

```bash
ls -l /var/run/docker.sock
srw-rw----. 1 root root 0 Feb  5 14:03 /var/run/docker.sock
```

Нужно запускать докер с правами dockerroot, для чего необходимо изменить владельца сокета демона Docker в конфигурационном файле /etc/docker/daemon.json:

```bash
{
    "live-restore": true,
    "group": "dockerroot"
}
```

Рестартуем docker и проверяем

```bash
systemctl restart docker

ls -l /var/run/docker.sock
srw-rw----. 1 root dockerroot 0 Feb  5 14:13 /var/run/docker.sock
```

Подключаемся пользователем otusadm

```bash
ssh otusadm@10.0.2.15
otusadm@10.0.2.15's password: 

Last failed login: Mon Feb  5 14:14:07 UTC 2024 from 10.0.2.15 on ssh:notty
There was 1 failed login attempt since the last successful login.
Last login: Mon Feb  5 14:02:50 2024 from 10.0.2.15

[otusadm@localhost ~]$ docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

# Работа с docker настроена

[otusadm@localhost ~]$ sudo systemctl restart docker

```

Проверяем под root (под otusadm не даст - нет полномочий, ведь дали только на рестарт)

```bash
systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; vendor preset: disabled)
   Active: active (running) since Mon 2024-02-05 14:26:10 UTC; 46s ago
...

# Видим, что сервис был рестартован 46 сек. назад
```