# Ansible playbook для развёртки nextcloud

**Описание:**

ОС хоста: Ubuntu 22.04

ОС таргетов: Ubuntu 22.04

версия ansible: 2.10.8

версия python: 3.10.12

Устанавливаемое программное обеспечение: Nextcloud, OnlyOffice.

БД: MariaDB-10.6.12 с использованием Galera Cluster.

**Примечание:**

Для установки Nextcloud требуется указать ссылку на tar/zip пакет в переменной **nextcloud_url** в файле vars.yaml. (Ссылка на страницу пакетов Nextcloud [тут](https://nextcloud.com/install/))

OnlyOffice поднимается в docker контейнере в стандартной конфигурации, указать внешний порт контейнера можно в переменной **onlyoffice_ext_port** в vars.yaml.

MariaDB Galera Cluster работает в конфигурации master - master. Сначала ролью mysql-cluster-mgm конфигурируется и подключается главная нода из группы [mysql_cluster_mgm], далее ролью mysql-cluster-data конфигурируются реплики [mysql_cluster_data] и подключаются к главной ноде.

**Процесс:**

1. Склонируйте репозиторий с плейбуком.
2. Внесите адреса таргетов в inventory.ini, где:
группа [mysql_cluster_mgm] – главная (primary) нода, а [mysql_cluster_data] – реплики.
3. Пропишите свои переменные.
4. Запустите плейбук командой:
```
ansible-playbook -i inventory.ini playbooks/nextcloud.yaml
```


