# Домашнее задание 18. PXE

## Задание

1. Следуя шагам из документа [https://docs.centos.org/en-US/8-docs/advanced-install/assembly_preparing-for-a-network-install](https://docs.centos.org/en-US/8-docs/advanced-install/assembly_preparing-for-a-network-install) установить и настроить загрузку по сети для дистрибутива CentOS8.В качестве шаблона воспользуйтесь репозиторием [https://github.com/nixuser/virtlab/tree/main/centos_pxe](https://github.com/nixuser/virtlab/tree/main/centos_pxe).
2. Поменять установку из репозитория NFS на установку из репозитория HTTP.
3. Настроить автоматическую установку для созданного kickstart файла (*) Файл загружается по HTTP.
4. Задание со звездочкой - автоматизировать процесс установки Cobbler cледуя шагам из документа [https://cobbler.github.io/quickstart/](https://cobbler.github.io/quickstart/).

# Решение

### Стенд

Так как мой ПК не поддерживает встроенную виртуализацию Nested VT-x, то стенд представляет из себя 3 ВМ:

- pxeserver - Загрузочный сервер (ip 10.0.0.20)
- pxeclient - Клиент (получение IP по DHCP из диапазона 10.0.0.100-10.0.0.120)
- ansible - сервер управления, для конфигурации pxserver (ip 10.0.0.150)

### Подготовка ВМ

Сначала необходимо подготовить ВМ ansible и pxeserver

По указанному в методичке адресу [https://mirror.sale-dedic.com/centos/8.4.2105/isos/x86_64/CentOS-8.4.2105-x86_64-dvd1.iso](https://mirror.sale-dedic.com/centos/8.4.2105/isos/x86_64/CentOS-8.4.2105-x86_64-dvd1.iso) - нет файла (404 Not Found)

Для ускорения разворачивания стенда скачиваем заранее ISO-образ CentOS 8

[https://mirror.nsc.liu.se/centos-store/8.4.2105/isos/x86_64/CentOS-8.4.2105-x86_64-dvd1.iso](https://mirror.nsc.liu.se/centos-store/8.4.2105/isos/x86_64/CentOS-8.4.2105-x86_64-dvd1.iso)

Потом мы можем его подкидывать через vagrant provision или загружая напрямую в вм ansible

Запускаем разворачивание ВМ

```ruby
vagrant up ansible pxeserver
```

В результате чего будут развернуты 2 ВМ с установленным необходимым ПО.

На ВМ ansible в /home/vagrant копируем образ CentOS-8.4.2105-x86_64-dvd1.iso посредством scp или загрузкой файла в MobaXterm.

### Настройка с помощью ansible playbook

Подключаемся по ssh к ВМ ansible.
playbook provision.yml пришлось немного изменить, т.к. шаг `name: set up httpd config` приводит к ошибке нехватки памяти.
Добавляем модуль ansible.posix, который позволяет копировать файл образа посредством rsync (который потребляет меньше памяти)

```ruby
cd ansible

# Установка модуля
ansible-galaxy collection install ansible.posix
Process install dependency map
Starting collection install process
Installing 'ansible.posix:1.5.4' to '/home/vagrant/.ansible/collections/ansible_collections/ansible/posix'

# Запуск playbook
ansible-playbook ./provision.yml -i ./hosts
```

В результате чего будет произведена настройка pxeserver

Проверяем, что данные загрузочного образа доступны по http

!(pic/Untitled.png)

## Загрузка ВМ pxeclient по сети

Выполняем загрузку ВМ pxeclient

```ruby
vagrant up pxeclient
```

Подключаемся к консоли ВМ. Видим, что появилось меню загрузки.

!(pic/Untitled%201.png)

При выборе соответствующего раздела происходит процесс инсталляции ОС.

При выборе автоматической установки при настройке согласно методичке имеется какая-то проблема

!(pic/Untitled%202.png)

Разбираться с которой уже выше моих сил. Большая часть времени по домашним заданиям уходит на поиск решений напрямую не связанных с самим заданием и частично из-за того, что методички устарели и требуют актуализации.

!(pic/Untitled%203.png)

Видим, что ip-адрес получен из диапазона DHCP
