# Домашнее задание 7. RPM

## Задание

Что нужно сделать?

- создать свой RPM (можно взять свое приложение, либо собрать к примеру апач с определенными опциями);
- создать свой репо и разместить там свой RPM;
- реализовать это все либо в вагранте, либо развернуть у себя через nginx и дать ссылку на репо.

# Решение

Используем простейшую конфигурацию Vagrantfile для запуска ВМ c Centos 8 Stream

Запускаем ВМ и подключаемся к ней.

`vagrant up`

`vagrant ssh`

### Подготовка к сборке

```bash
sudo -i

# Устанавливаем дополнительные пакеты, которые потребуются для сборки
yum install -y redhat-lsb-core wget rpmdevtools rpm-build createrepo yum-utils gcc nano tree

# Загружаем SRPM пакет NGINX
wget https://nginx.org/packages/centos/8/SRPMS/nginx-1.20.2-1.el8.ngx.src.rpm
--2023-12-12 05:46:22--  https://nginx.org/packages/centos/8/SRPMS/nginx-1.20.2-1.el8.ngx.src.rpm
...
2023-12-12 05:46:24 (1.41 MB/s) - ‘nginx-1.20.2-1.el8.ngx.src.rpm’ saved [1086865/1086865]

# Подготавливаем дерево директорий для сборки пакета
rpmdev-setuptree
tree rpmbuild
rpmbuild
├── BUILD    # содержит все файлы, которые появляются при создании пакета.
├── RPMS     # сюда будут складываться готовые пакеты
├── SOURCES  # для исходников, из которых и будут собираться RPM-пакеты
├── SPECS    # для файлов с описанием процесса сборки
└── SRPMS    # для исходников RPM-файлов

# Распаковываем пакет NGINX
rpm -i nginx-1.20.2-1.el8.ngx.src.rpm

# Качаем и распаковываем исходник для OpenSSL
wget https://github.com/openssl/openssl/archive/refs/heads/OpenSSL_1_1_1-stable.zip
unzip OpenSSL_1_1_1-stable.zip

# поставим все зависимости, чтобы в процессе сборки не было ошибок
yum-builddep /root/rpmbuild/SPECS/nginx.spec
Last metadata expiration check: 0:02:49 ago on Tue 12 Dec 2023 06:24:27 AM UTC.
...
Complete!

# Редактируем spec для добавления openssl (примерно 114 строка)
nano /root/rpmbuild/SPECS/nginx.spec
...
%build
./configure %{BASE_CONFIGURE_ARGS} \
    --with-cc-opt="%{WITH_CC_OPT}" \
    --with-ld-opt="%{WITH_LD_OPT}" \
		--with-openssl=/root/openssl-OpenSSL_1_1_1-stable \  # << Добавляем ключ для сборки с SSL
    --with-debug
...
```

### Сборка пакета

```bash
rpmbuild -bb /root/rpmbuild/SPECS/nginx.spec
...
Wrote: /root/rpmbuild/RPMS/x86_64/nginx-1.20.2-1.el8.ngx.x86_64.rpm
Wrote: /root/rpmbuild/RPMS/x86_64/nginx-debuginfo-1.20.2-1.el8.ngx.x86_64.rpm
Executing(%clean): /bin/sh -e /var/tmp/rpm-tmp.15zOyW
+ umask 022
+ cd /root/rpmbuild/BUILD
+ cd nginx-1.20.2
+ /usr/bin/rm -rf /root/rpmbuild/BUILDROOT/nginx-1.20.2-1.el8.ngx.x86_64
+ exit 0

# Проверяем создание файлов
ls -l /root/rpmbuild/RPMS/x86_64/
total 4676
-rw-r--r--. 1 root root 2249516 Dec 12 07:17 nginx-1.20.2-1.el8.ngx.x86_64.rpm
-rw-r--r--. 1 root root 2533980 Dec 12 07:17 nginx-debuginfo-1.20.2-1.el8.ngx.x86_64.rpm

```

### Установка пакета

```bash
# Производим установку из собранного пакета
yum localinstall -y /root/rpmbuild/RPMS/x86_64/nginx-1.20.2-1.el8.ngx.x86_64.rpm

# Запускаем NGINX
systemctl start nginx
systemctl status nginx
● nginx.service - nginx - high performance web server
   Loaded: loaded (/usr/lib/systemd/system/nginx.service; disabled; vendor preset: disabled)   
   Active: active (running) since Tue 2023-12-12 07:39:22 UTC; 1s ago
...
```

### Создание репозитория

```bash
# Создаем директорию под репозиторий
mkdir /usr/share/nginx/html/repo

# Копируем собранный пакет nginx в директорий репозитория
cp rpmbuild/RPMS/x86_64/nginx-1.20.2-1.el8.ngx.x86_64.rpm /usr/share/nginx/html/repo/

# Скачиваем и размещаем в репозиторий другой пакет 
wget https://downloads.percona.com/downloads/percona-distribution-mysql-ps/percona-distribution-mysql-ps-8.0.28/binary/redhat/8/x86_64/percona-orchestrator-3.2.6-2.el8.x86_64.rpm -O /usr/share/nginx/html/repo/percona-orchestrator-3.2.6-2.el8.x86_64.rpm

ll /usr/share/nginx/html/repo/
total 7304
-rw-r--r--. 1 root root 2249516 Dec 12 07:47 nginx-1.20.2-1.el8.ngx.x86_64.rpm
-rw-r--r--. 1 root root 5222976 Feb 16  2022 percona-orchestrator-3.2.6-2.el8.x86_64.rpm

# Инициализируем репо
createrepo /usr/share/nginx/html/repo/
Directory walk started
Directory walk done - 2 packages
Temporary output repo path: /usr/share/nginx/html/repo/.repodata/
Preparing sqlite DBs
Pool started (with 5 workers)
Pool finished

# настройка NGINX для доступа к репо
nano /etc/nginx/conf.d/default.conf

location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
				autoindex on;                   << Добавим
    }

# Проверяем корректность cofig-файла и рестартуем nginx
nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful

nginx -s reload

# Проверяем
curl -a http://localhost/repo/
<html>
<head><title>Index of /repo/</title></head>
<body>
<h1>Index of /repo/</h1><hr><pre><a href="../">../</a>
<a href="repodata/">repodata/</a>                                          12-Dec-2023 07:52   
                -
<a href="nginx-1.20.2-1.el8.ngx.x86_64.rpm">nginx-1.20.2-1.el8.ngx.x86_64.rpm</a>
    12-Dec-2023 07:47             2249516
<a href="percona-orchestrator-3.2.6-2.el8.x86_64.rpm">percona-orchestrator-3.2.6-2.el8.x86_64.rpm</a>        16-Feb-2022 15:57             5222976
</pre><hr></body>
</html>

# Добавляем созданный репо в /etc/yum.repos.d
cat >> /etc/yum.repos.d/otus.repo << EOF
[otus]
name=otus-linux
baseurl=http://localhost/repo
gpgcheck=0
enabled=1
EOF

# Проверяем, что репозиторий подключен
yum repolist enabled | grep otus
otus                otus-linux

# Содержание репозитория
yum list | grep otus

# Устанвливаем из нашего репозитория пакет percona-orchestrator.x86_64
yum install percona-orchestrator.x86_64
```