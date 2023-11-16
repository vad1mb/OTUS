# Занятие 1. Vagrant-стенд для обновления ядра и создания образа системы
## Цель домашнего задания
Научиться обновлять ядро в ОС Linux. Получение навыков работы с Vagrant, Packer и публикацией готовых образов в Vagrant Cloud.

## Описание домашнего задания

1. Обновить ядро ОС из репозитория ELRepo
2. Создать Vagrant box c помощью Packer
3. Загрузить Vagrant box в Vagrant Cloud

# Решение

```
clone https://github.com/vad1mb/OTUS
cd OTUS/dz01
vagrant up
vagrant ssh

uname -r
```

## Запуск виртуальной машины с помощью Vagrant

Создаем Vagrantfile согласно методичке.
При выполнении `vagrant up` имеем ошибки:

```bash
Bringing machine 'kernel-update' up with 'virtualbox' provider...
==> kernel-update: Box 'generic/centos8s' could not be found. Attempting to find and install...
    kernel-update: Box Provider: virtualbox
    kernel-update: Box Version: 4.3.4
The box 'generic/centos8s' could not be found or
could not be accessed in the remote catalog. If this is a private
box on HashiCorp's Vagrant Cloud, please verify you're logged in via
`vagrant login`. Also, please double-check the name. The expanded
URL and error message are shown below:

URL: ["https://vagrantcloud.com/generic/centos8s"]
Error: The requested URL returned error: 404
```

Из-за блокировки не дает скачать box-файл.
Скачиваем с помощью браузера с proxy/vpn [https://app.vagrantup.com/generic/boxes/centos8s/versions/4.3.4](https://app.vagrantup.com/generic/boxes/centos8s/versions/4.3.4) как centos8s_4.3.4.box

Добавляем в локальный репозиторий vagrant-а (можно переопределить расположение репозитория через переменную среды - VAGRANT_HOME=G:\OTUS\.vagrant.d)

`vagrant box add generic/centos8s file:///c:/temp/download/centos8s_4.3.4.box`

Но в этом случае теряется информация о версии

generic/centos8s (virtualbox, 0)

Для корректного добавления необходимо создать json-файл с метаданными:

```json
{
   "name": "generic/centos8s",
   "versions": [
     {
       "version": "4.3.4",
       "providers": [
         {
           "name": "virtualbox",
           "url": "file:///g:/OTUS/centos8s_4.3.4.box"
         }
       ]
     }
   ]
 }
```

И загрузить командой 

`vagrant box add generic/centos8s ./metadata.json -f`

После чего информация отображается верно:

`vagrant box list`
generic/centos8s (virtualbox, 4.3.4)

## Обновление ядра

Подключаемся к ВМ

`vagrant ssh`

Смотрим версию ядра

```bash
uname -r
4.18.0-516.el8.x86_64
```

Подключаем репозиторий

```bash
sudo yum install -y https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm
CentOS Stream 8 - AppStream                                    3.3 kB/s | 4.4 kB     00:01
CentOS Stream 8 - BaseOS                                       6.4 kB/s | 3.9 kB     00:00
CentOS Stream 8 - Extras                                       8.9 kB/s | 2.9 kB     00:00
CentOS Stream 8 - Extras common packages                       3.8 kB/s | 3.0 kB     00:00
Extra Packages for Enterprise Linux 8 - x86_64                  23 kB/s |  34 kB     00:01
Extra Packages for Enterprise Linux 8 - Next - x86_64           36 kB/s |  33 kB     00:00
elrepo-release-8.el8.elrepo.noarch.rpm                         7.0 kB/s |  13 kB     00:01
Dependencies resolved.
===============================================================================================
 Package                 Architecture    Version                   Repository             Size
===============================================================================================
Installing:
 elrepo-release          noarch          8.3-1.el8.elrepo          @commandline           13 k

Transaction Summary
===============================================================================================
Install  1 Package

Total size: 13 k
Installed size: 5.0 k
Downloading Packages:
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                       1/1
  Installing       : elrepo-release-8.3-1.el8.elrepo.noarch                                1/1
  Verifying        : elrepo-release-8.3-1.el8.elrepo.noarch                                1/1

Installed:
  elrepo-release-8.3-1.el8.elrepo.noarch

Complete!
```

Установим последнее ядро из репозитория elrepo-kernel:

```bash
sudo yum --enablerepo elrepo-kernel install kernel-ml -y
ELRepo.org Community Enterprise Linux Repository - el8                                 110 kB/s | 248 kB     00:02
ELRepo.org Community Enterprise Linux Kernel Repository - el8                          1.2 MB/s | 2.1 MB     00:01
Dependencies resolved.
=======================================================================================================================
 Package                        Architecture        Version                           Repository                  Size
=======================================================================================================================
Installing:
 kernel-ml                      x86_64              6.6.1-1.el8.elrepo                elrepo-kernel              117 k
Installing dependencies:
 kernel-ml-core                 x86_64              6.6.1-1.el8.elrepo                elrepo-kernel               38 M
 kernel-ml-modules              x86_64              6.6.1-1.el8.elrepo                elrepo-kernel               34 M

Transaction Summary
=======================================================================================================================
Install  3 Packages

Total download size: 72 M
Installed size: 114 M
Downloading Packages:
(1/3): kernel-ml-6.6.1-1.el8.elrepo.x86_64.rpm                                         159 kB/s | 117 kB     00:00
(2/3): kernel-ml-modules-6.6.1-1.el8.elrepo.x86_64.rpm                                 6.0 MB/s |  34 MB     00:05
(3/3): kernel-ml-core-6.6.1-1.el8.elrepo.x86_64.rpm                                    6.0 MB/s |  38 MB     00:06
-----------------------------------------------------------------------------------------------------------------------
Total                                                                                   11 MB/s |  72 MB     00:06
ELRepo.org Community Enterprise Linux Kernel Repository - el8                          114 kB/s | 1.7 kB     00:00
Importing GPG key 0xBAADAE52:
 Userid     : "elrepo.org (RPM Signing Key for elrepo.org) <secure@elrepo.org>"
 Fingerprint: 96C0 104F 6315 4731 1E0B B1AE 309B C305 BAAD AE52
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org
Key imported successfully
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                  1/1
  Installing       : kernel-ml-core-6.6.1-1.el8.elrepo.x86_64                                                         1/3
  Running scriptlet: kernel-ml-core-6.6.1-1.el8.elrepo.x86_64                                                         1/3
  Installing       : kernel-ml-modules-6.6.1-1.el8.elrepo.x86_64                                                      2/3
  Running scriptlet: kernel-ml-modules-6.6.1-1.el8.elrepo.x86_64                                                      2/3
  Installing       : kernel-ml-6.6.1-1.el8.elrepo.x86_64                                                              3/3
  Running scriptlet: kernel-ml-core-6.6.1-1.el8.elrepo.x86_64                                                         3/3
dracut: Disabling early microcode, because kernel does not support it. CONFIG_MICROCODE_[AMD|INTEL]!=y
dracut: Disabling early microcode, because kernel does not support it. CONFIG_MICROCODE_[AMD|INTEL]!=y

  Running scriptlet: kernel-ml-6.6.1-1.el8.elrepo.x86_64                                                              3/3
  Verifying        : kernel-ml-6.6.1-1.el8.elrepo.x86_64                                                              1/3
  Verifying        : kernel-ml-core-6.6.1-1.el8.elrepo.x86_64                                                         2/3
  Verifying        : kernel-ml-modules-6.6.1-1.el8.elrepo.x86_64                                                      3/3

Installed:
  kernel-ml-6.6.1-1.el8.elrepo.x86_64                           kernel-ml-core-6.6.1-1.el8.elrepo.x86_64
  kernel-ml-modules-6.6.1-1.el8.elrepo.x86_64

Complete!
```

Перегружаем хост `sudo reboot`

Проверяем версию ядра после перезагрузки

```bash
uname -r
6.6.1-1.el8.elrepo.x86_64
```

Установлено новое ядро.

## Создание образа системы

`packer build centos.json`

Log packer-а
```bash
    packer build centos.json
    Warning: Bundled plugins used
    
    This template relies on the use of plugins bundled into the Packer binary.
    The practice of bundling external plugins into Packer will be removed in an
    upcoming version.
    
    To remove this warning and ensure builds keep working you can install these
    external plugins with the 'packer plugins install' command
    
    * packer plugins install github.com/hashicorp/vagrant
    * packer plugins install github.com/hashicorp/virtualbox
    
    Alternatively, if you upgrade your templates to HCL2, you can use 'packer init'
    with a 'required_plugins' block to automatically install external plugins.
    
    You can try HCL2 by running 'packer hcl2_upgrade G:\OTUS\h0\packer\centos.json'
    
    virtualbox-iso.centos-8stream: output will be in this color.
    
    ==> virtualbox-iso.centos-8stream: Retrieving Guest additions
    ==> virtualbox-iso.centos-8stream: Trying C:\Program Files\Oracle\VirtualBox/VBoxGuestAdditions.iso  
    ==> virtualbox-iso.centos-8stream: Trying file://C:/Program%20Files/Oracle/VirtualBox/VBoxGuestAdditions.iso
    ==> virtualbox-iso.centos-8stream: file://C:/Program%20Files/Oracle/VirtualBox/VBoxGuestAdditions.iso => C:/Program Files/Oracle/VirtualBox/VBoxGuestAdditions.iso
    ==> virtualbox-iso.centos-8stream: Retrieving ISO
    ==> virtualbox-iso.centos-8stream: Trying https://mirror.linux-ia64.org/centos/8-stream/isos/x86_64/CentOS-Stream-8-x86_64-latest-boot.iso
    ==> virtualbox-iso.centos-8stream: Trying https://mirror.linux-ia64.org/centos/8-stream/isos/x86_64/CentOS-Stream-8-x86_64-latest-boot.iso?checksum=sha256%3Afcbbb6a91cf93e46a2e5f702bae23852949d7c7b143a8614ca60ef491e3db8e8
    ==> virtualbox-iso.centos-8stream: https://mirror.linux-ia64.org/centos/8-stream/isos/x86_64/CentOS-Stream-8-x86_64-latest-boot.iso?checksum=sha256%3Afcbbb6a91cf93e46a2e5f702bae23852949d7c7b143a8614ca60ef491e3db8e8 => G:\OTUS\h0\packer\packer_cache\5aab19a44a01d9cdf6c02f7df6fe166532738fba.iso
    ==> virtualbox-iso.centos-8stream: Starting HTTP server on port 8757
    ==> virtualbox-iso.centos-8stream: Creating virtual machine...
    ==> virtualbox-iso.centos-8stream: Creating hard drive builds\packer-centos-vm.vdi with size 10240 MiB...
    ==> virtualbox-iso.centos-8stream: Mounting ISOs...
        virtualbox-iso.centos-8stream: Mounting boot ISO...
    ==> virtualbox-iso.centos-8stream: Creating forwarded port mapping for communicator (SSH, WinRM, etc) (host port 2698)
    ==> virtualbox-iso.centos-8stream: Executing custom VBoxManage commands...
        virtualbox-iso.centos-8stream: Executing: modifyvm packer-centos-vm --memory 1024
        virtualbox-iso.centos-8stream: Executing: modifyvm packer-centos-vm --cpus 2
        virtualbox-iso.centos-8stream: Executing: modifyvm packer-centos-vm --nat-localhostreachable1 on
    ==> virtualbox-iso.centos-8stream: Starting the virtual machine...
    ==> virtualbox-iso.centos-8stream: Waiting 10s for boot...
    ==> virtualbox-iso.centos-8stream: Typing the boot command...
    ==> virtualbox-iso.centos-8stream: Using SSH communicator to connect: 127.0.0.1
    ==> virtualbox-iso.centos-8stream: Waiting for SSH to become available...
    ==> virtualbox-iso.centos-8stream: Connected to SSH!
    ==> virtualbox-iso.centos-8stream: Uploading VirtualBox version info (7.0.12)
    ==> virtualbox-iso.centos-8stream: Uploading VirtualBox guest additions ISO...
    ==> virtualbox-iso.centos-8stream: Pausing 20s before the next provisioner...
    ==> virtualbox-iso.centos-8stream: Provisioning with shell script: scripts/stage-1-kernel-update.sh
        virtualbox-iso.centos-8stream:
        virtualbox-iso.centos-8stream: We trust you have received the usual lecture from the local System    virtualbox-iso.centos-8stream: Administrator. It usually boils down to these three things:
        virtualbox-iso.centos-8stream:
        virtualbox-iso.centos-8stream:     #1) Respect the privacy of others.
        virtualbox-iso.centos-8stream:     #2) Think before you type.
        virtualbox-iso.centos-8stream:     #3) With great power comes great responsibility.
        virtualbox-iso.centos-8stream:
        virtualbox-iso.centos-8stream: CentOS Stream 8 - AppStream                      13 MB/s |  34 MB     00:02
        virtualbox-iso.centos-8stream: CentOS Stream 8 - BaseOS                        9.4 MB/s |  53 MB     00:05
        virtualbox-iso.centos-8stream: CentOS Stream 8 - Extras                         29 kB/s |  18 kB     00:00
        virtualbox-iso.centos-8stream: CentOS Stream 8 - Extras common packages        7.5 kB/s | 6.9 kB     00:00
        virtualbox-iso.centos-8stream: elrepo-release-8.el8.elrepo.noarch.rpm           10 kB/s |  13 kB     00:01
        virtualbox-iso.centos-8stream: Dependencies resolved.
        virtualbox-iso.centos-8stream: ================================================================================
        virtualbox-iso.centos-8stream:  Package             Arch        Version                Repository         Size
        virtualbox-iso.centos-8stream: ================================================================================
        virtualbox-iso.centos-8stream: Installing:
        virtualbox-iso.centos-8stream:  elrepo-release      noarch      8.3-1.el8.elrepo       @commandline       13 k
        virtualbox-iso.centos-8stream:
        virtualbox-iso.centos-8stream: Transaction Summary
        virtualbox-iso.centos-8stream: ================================================================================
        virtualbox-iso.centos-8stream: Install  1 Package
        virtualbox-iso.centos-8stream:
        virtualbox-iso.centos-8stream: Total size: 13 k
        virtualbox-iso.centos-8stream: Installed size: 5.0 k
        virtualbox-iso.centos-8stream: Downloading Packages:
        virtualbox-iso.centos-8stream: Running transaction check
        virtualbox-iso.centos-8stream: Transaction check succeeded.
        virtualbox-iso.centos-8stream: Running transaction test
        virtualbox-iso.centos-8stream: Transaction test succeeded.
        virtualbox-iso.centos-8stream: Running transaction
        virtualbox-iso.centos-8stream:   Preparing        :                                                        1/1
        virtualbox-iso.centos-8stream:   Installing       : elrepo-release-8.3-1.el8.elrepo.noarch                 1/1
        virtualbox-iso.centos-8stream:   Verifying        : elrepo-release-8.3-1.el8.elrepo.noarch                 1/1
        virtualbox-iso.centos-8stream:
        virtualbox-iso.centos-8stream: Installed:
        virtualbox-iso.centos-8stream:   elrepo-release-8.3-1.el8.elrepo.noarch
        virtualbox-iso.centos-8stream:
        virtualbox-iso.centos-8stream: Complete!
        virtualbox-iso.centos-8stream: ELRepo.org Community Enterprise Linux Repositor 137 kB/s | 248 kB     00:01
        virtualbox-iso.centos-8stream: ELRepo.org Community Enterprise Linux Kernel Re 1.2 MB/s | 2.1 MB     00:01
        virtualbox-iso.centos-8stream: Dependencies resolved.
        virtualbox-iso.centos-8stream: ================================================================================
        virtualbox-iso.centos-8stream:  Package              Arch      Version                  Repository        Size
        virtualbox-iso.centos-8stream: ================================================================================
        virtualbox-iso.centos-8stream: Installing:
        virtualbox-iso.centos-8stream:  kernel-ml            x86_64    6.6.1-1.el8.elrepo       elrepo-kernel    117 k
        virtualbox-iso.centos-8stream: Installing dependencies:
        virtualbox-iso.centos-8stream:  kernel-ml-core       x86_64    6.6.1-1.el8.elrepo       elrepo-kernel     38 M
        virtualbox-iso.centos-8stream:  kernel-ml-modules    x86_64    6.6.1-1.el8.elrepo       elrepo-kernel     34 M
        virtualbox-iso.centos-8stream:
        virtualbox-iso.centos-8stream: Transaction Summary
        virtualbox-iso.centos-8stream: ================================================================================
        virtualbox-iso.centos-8stream: Install  3 Packages
        virtualbox-iso.centos-8stream:
        virtualbox-iso.centos-8stream: Total download size: 72 M
        virtualbox-iso.centos-8stream: Installed size: 114 M
        virtualbox-iso.centos-8stream: Downloading Packages:
        virtualbox-iso.centos-8stream: (1/3): kernel-ml-6.6.1-1.el8.elrepo.x86_64.rpm  192 kB/s | 117 kB     00:00
        virtualbox-iso.centos-8stream: (2/3): kernel-ml-modules-6.6.1-1.el8.elrepo.x86 5.1 MB/s |  34 MB     00:06
        virtualbox-iso.centos-8stream: (3/3): kernel-ml-core-6.6.1-1.el8.elrepo.x86_64 5.4 MB/s |  38 MB     00:07
        virtualbox-iso.centos-8stream: --------------------------------------------------------------------------------
        virtualbox-iso.centos-8stream: Total                                           9.6 MB/s |  72 MB     00:07
        virtualbox-iso.centos-8stream: ELRepo.org Community Enterprise Linux Kernel Re 444 kB/s | 1.7 kB     00:00
        virtualbox-iso.centos-8stream: Importing GPG key 0xBAADAE52:
        virtualbox-iso.centos-8stream:  Userid     : "elrepo.org (RPM Signing Key for elrepo.org) <secure@elrepo.org>"
        virtualbox-iso.centos-8stream:  Fingerprint: 96C0 104F 6315 4731 1E0B B1AE 309B C305 BAAD AE52
        virtualbox-iso.centos-8stream:  From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org
        virtualbox-iso.centos-8stream: Key imported successfully
        virtualbox-iso.centos-8stream: Running transaction check
        virtualbox-iso.centos-8stream: Transaction check succeeded.
        virtualbox-iso.centos-8stream: Running transaction test
        virtualbox-iso.centos-8stream: Transaction test succeeded.
        virtualbox-iso.centos-8stream: Running transaction
        virtualbox-iso.centos-8stream:   Preparing        :                                                        1/1
        virtualbox-iso.centos-8stream:   Installing       : kernel-ml-core-6.6.1-1.el8.elrepo.x86_64               1/3
        virtualbox-iso.centos-8stream:   Running scriptlet: kernel-ml-core-6.6.1-1.el8.elrepo.x86_64               1/3
        virtualbox-iso.centos-8stream:   Installing       : kernel-ml-modules-6.6.1-1.el8.elrepo.x86_64            2/3
        virtualbox-iso.centos-8stream:   Running scriptlet: kernel-ml-modules-6.6.1-1.el8.elrepo.x86_64            2/3
        virtualbox-iso.centos-8stream:   Installing       : kernel-ml-6.6.1-1.el8.elrepo.x86_64                    3/3
        virtualbox-iso.centos-8stream:   Running scriptlet: kernel-ml-core-6.6.1-1.el8.elrepo.x86_64               3/3
        virtualbox-iso.centos-8stream: dracut: Disabling early microcode, because kernel does not support it. CONFIG_MICROCODE_[AMD|INTEL]!=y
        virtualbox-iso.centos-8stream:
        virtualbox-iso.centos-8stream:   Running scriptlet: kernel-ml-6.6.1-1.el8.elrepo.x86_64                    3/3
        virtualbox-iso.centos-8stream:   Verifying        : kernel-ml-6.6.1-1.el8.elrepo.x86_64                    1/3
        virtualbox-iso.centos-8stream:   Verifying        : kernel-ml-core-6.6.1-1.el8.elrepo.x86_64               2/3
        virtualbox-iso.centos-8stream:   Verifying        : kernel-ml-modules-6.6.1-1.el8.elrepo.x86_64            3/3
        virtualbox-iso.centos-8stream:
        virtualbox-iso.centos-8stream: Installed:
        virtualbox-iso.centos-8stream:   kernel-ml-6.6.1-1.el8.elrepo.x86_64
        virtualbox-iso.centos-8stream:   kernel-ml-core-6.6.1-1.el8.elrepo.x86_64
        virtualbox-iso.centos-8stream:   kernel-ml-modules-6.6.1-1.el8.elrepo.x86_64
        virtualbox-iso.centos-8stream:
        virtualbox-iso.centos-8stream: Complete!
        virtualbox-iso.centos-8stream: Generating grub configuration file ...
        virtualbox-iso.centos-8stream: done
        virtualbox-iso.centos-8stream: Grub update done.
    ==> virtualbox-iso.centos-8stream: Provisioning with shell script: scripts/stage-2-clean.sh
        virtualbox-iso.centos-8stream: [sudo] password for vagrant: Last metadata expiration check: 0:02:47 ago on Mon 13 Nov 2023 06:44:17 AM EST.
        virtualbox-iso.centos-8stream: Dependencies resolved.
        virtualbox-iso.centos-8stream: Nothing to do.
        virtualbox-iso.centos-8stream: Complete!
        virtualbox-iso.centos-8stream: 39 files removed
    ==> virtualbox-iso.centos-8stream: Gracefully halting virtual machine...
        virtualbox-iso.centos-8stream: [sudo] password for vagrant:
    ==> virtualbox-iso.centos-8stream: Preparing to export machine...
        virtualbox-iso.centos-8stream: Deleting forwarded port mapping for the communicator (SSH, WinRM, etc) (host port 2698)
     CentOS 8 Stream with kernel 6.x --version 8
    ==> virtualbox-iso.centos-8stream: Cleaning up floppy disk...
    ==> virtualbox-iso.centos-8stream: Deregistering and deleting VM...
    ==> virtualbox-iso.centos-8stream: Running post-processor: vagrant
    ==> virtualbox-iso.centos-8stream (vagrant): Creating a dummy Vagrant box to ensure the host system can create one correctly
    ==> virtualbox-iso.centos-8stream (vagrant): Creating Vagrant box for 'virtualbox' provider
        virtualbox-iso.centos-8stream (vagrant): Copying from artifact: builds\packer-centos-vm-disk001.vmdk
        virtualbox-iso.centos-8stream (vagrant): Copying from artifact: builds\packer-centos-vm.mf
        virtualbox-iso.centos-8stream (vagrant): Copying from artifact: builds\packer-centos-vm.ovf
        virtualbox-iso.centos-8stream (vagrant): Renaming the OVF to box.ovf...
        virtualbox-iso.centos-8stream (vagrant): Compressing: Vagrantfile
        virtualbox-iso.centos-8stream (vagrant): Compressing: box.ovf
        virtualbox-iso.centos-8stream (vagrant): Compressing: metadata.json
        virtualbox-iso.centos-8stream (vagrant): Compressing: packer-centos-vm-disk001.vmdk
        virtualbox-iso.centos-8stream (vagrant): Compressing: packer-centos-vm.mf
    Build 'virtualbox-iso.centos-8stream' finished after 43 minutes 52 seconds.
    
    ==> Wait completed after **43 minutes 52 seconds**
    
    ==> Builds finished. The artifacts of successful builds are:
    --> virtualbox-iso.centos-8stream: 'virtualbox' provider box: centos-8-kernel-6-x86_64-Minimal.box
```
    

Для проверки  импортируем полученный vagrant box в Vagrant:

`vagrant box add —name centos8-kernel6 centos-8-kernel-6-x86_64-Minimal.box`

```bash
vagrant box list
centos8-kernel6  (virtualbox, 0)
generic/centos8s (virtualbox, 4.3.4)
```

Проверяем. 

```bash
mkdir check
cd check
vagrant init centos8-kernel6
vagrant up
vagrant ssh
```
 
```bash
sudo uname -r
6.6.1-1.el8.elrepo.x86_64
```
