# Log запуска хостов

```bash
Bringing machine 'backup' up with 'virtualbox' provider...
Bringing machine 'client' up with 'virtualbox' provider...
Bringing machine 'ansible' up with 'virtualbox' provider...
==> backup: Importing base box 'centos/7'...
==> backup: Matching MAC address for NAT networking...
==> backup: Checking if box 'centos/7' version '2004.01' is up to date...
==> backup: Setting the name of the VM: dz17_backup_1708862775453_58394
==> backup: Clearing any previously set network interfaces...
==> backup: Preparing network interfaces based on configuration...
    backup: Adapter 1: nat
    backup: Adapter 2: intnet
==> backup: Forwarding ports...
    backup: 22 (guest) => 2222 (host) (adapter 1)
==> backup: Running 'pre-boot' VM customizations...
==> backup: Booting VM...
==> backup: Waiting for machine to boot. This may take a few minutes...
    backup: SSH address: 127.0.0.1:2222
    backup: SSH username: vagrant
    backup: SSH auth method: private key
    backup: 
    backup: Vagrant insecure key detected. Vagrant will automatically replace
    backup: this with a newly generated keypair for better security.
    backup: 
    backup: Inserting generated public key within guest...
    backup: Removing insecure key from the guest if it's present...
    backup: Key inserted! Disconnecting and reconnecting using new SSH key...
==> backup: Machine booted and ready!
==> backup: Checking for guest additions in VM...
    backup: No guest additions were detected on the base box for this VM! Guest
    backup: additions are required for forwarded ports, shared folders, host only
    backup: networking, and more. If SSH fails on this machine, please install
    backup: the guest additions and repackage the box to continue.
    backup:
    backup: This is not an error message; everything may continue to work properly,
    backup: in which case you may ignore this message.
==> backup: Setting hostname...
==> backup: Configuring and enabling network interfaces...
==> backup: Running provisioner: shell...
    backup: Running: inline script
==> backup: Running provisioner: shell...
    backup: Running: inline script
==> backup: Running provisioner: shell...
    backup: Running: inline script
==> backup: Running provisioner: shell...
    backup: Running: inline script
==> client: Importing base box 'centos/7'...
==> client: Matching MAC address for NAT networking...
==> client: Checking if box 'centos/7' version '2004.01' is up to date...
==> client: Setting the name of the VM: dz17_client_1708862870251_43400
==> client: Fixed port collision for 22 => 2222. Now on port 2200.
==> client: Clearing any previously set network interfaces...
==> client: Preparing network interfaces based on configuration...
    client: Adapter 1: nat
    client: Adapter 2: intnet
==> client: Forwarding ports...
    client: 22 (guest) => 2200 (host) (adapter 1)
==> client: Running 'pre-boot' VM customizations...
==> client: Booting VM...
==> client: Waiting for machine to boot. This may take a few minutes...
    client: SSH address: 127.0.0.1:2200
    client: SSH username: vagrant
    client: SSH auth method: private key
    client: 
    client: Vagrant insecure key detected. Vagrant will automatically replace
    client: this with a newly generated keypair for better security.
    client: 
    client: Inserting generated public key within guest...
    client: Removing insecure key from the guest if it's present...
    client: Key inserted! Disconnecting and reconnecting using new SSH key...
==> client: Machine booted and ready!
==> client: Checking for guest additions in VM...
    client: No guest additions were detected on the base box for this VM! Guest
    client: additions are required for forwarded ports, shared folders, host only
    client: networking, and more. If SSH fails on this machine, please install
    client: the guest additions and repackage the box to continue.
    client:
    client: This is not an error message; everything may continue to work properly,
    client: in which case you may ignore this message.
==> client: Setting hostname...
==> client: Configuring and enabling network interfaces...
==> client: Running provisioner: shell...
    client: Running: inline script
==> ansible: Importing base box 'centos/7'...
==> ansible: Matching MAC address for NAT networking...
==> ansible: Checking if box 'centos/7' version '2004.01' is up to date...
==> ansible: Setting the name of the VM: dz17_ansible_1708862949100_40594
==> ansible: Fixed port collision for 22 => 2222. Now on port 2201.
==> ansible: Clearing any previously set network interfaces...
==> ansible: Preparing network interfaces based on configuration...
    ansible: Adapter 1: nat
    ansible: Adapter 2: intnet
==> ansible: Forwarding ports...
    ansible: 22 (guest) => 2201 (host) (adapter 1)
==> ansible: Running 'pre-boot' VM customizations...
==> ansible: Booting VM...
==> ansible: Waiting for machine to boot. This may take a few minutes...
    ansible: SSH address: 127.0.0.1:2201
    ansible: SSH username: vagrant
    ansible: SSH auth method: private key
    ansible: 
    ansible: Vagrant insecure key detected. Vagrant will automatically replace
    ansible: this with a newly generated keypair for better security.
    ansible: 
    ansible: Inserting generated public key within guest...
    ansible: Removing insecure key from the guest if it's present...
    ansible: Key inserted! Disconnecting and reconnecting using new SSH key...
==> ansible: Machine booted and ready!
==> ansible: Checking for guest additions in VM...
    ansible: No guest additions were detected on the base box for this VM! Guest
    ansible: additions are required for forwarded ports, shared folders, host only
    ansible: networking, and more. If SSH fails on this machine, please install
    ansible: the guest additions and repackage the box to continue.
    ansible:
    ansible: This is not an error message; everything may continue to work properly,
    ansible: in which case you may ignore this message.
==> ansible: Setting hostname...
==> ansible: Configuring and enabling network interfaces...
==> ansible: Running provisioner: shell...
    ansible: Running: inline script
    ansible: Loaded plugins: fastestmirror
    ansible: Determining fastest mirrors
    ansible:  * base: ftp.nsc.ru
    ansible:  * extras: ftp.nsc.ru
    ansible:  * updates: ftp.nsc.ru
    ansible: Resolving Dependencies
    ansible: --> Running transaction check
    ansible: ---> Package python3.x86_64 0:3.6.8-21.el7_9 will be installed
    ansible: --> Processing Dependency: python3-libs(x86-64) = 3.6.8-21.el7_9 for package: python3-3.6.8-21.el7_9.x86_64
    ansible: --> Processing Dependency: python3-setuptools for package: python3-3.6.8-21.el7_9.x86_64
    ansible: --> Processing Dependency: python3-pip for package: python3-3.6.8-21.el7_9.x86_64
    ansible: --> Processing Dependency: libpython3.6m.so.1.0()(64bit) for package: python3-3.6.8-21.el7_9.x86_64
    ansible: --> Running transaction check
    ansible: ---> Package python3-libs.x86_64 0:3.6.8-21.el7_9 will be installed
    ansible: ---> Package python3-pip.noarch 0:9.0.3-8.el7 will be installed
    ansible: ---> Package python3-setuptools.noarch 0:39.2.0-10.el7 will be installed
    ansible: --> Finished Dependency Resolution
    ansible: 
    ansible: Dependencies Resolved
    ansible:
    ansible: ================================================================================
    ansible:  Package                  Arch         Version              Repository     Size
    ansible: ================================================================================
    ansible: Installing:
    ansible:  python3                  x86_64       3.6.8-21.el7_9       updates        71 k
    ansible: Installing for dependencies:
    ansible:  python3-libs             x86_64       3.6.8-21.el7_9       updates       7.0 M
    ansible:  python3-pip              noarch       9.0.3-8.el7          base          1.6 M
    ansible:  python3-setuptools       noarch       39.2.0-10.el7        base          629 k
    ansible: 
    ansible: Transaction Summary
    ansible: ================================================================================
    ansible: Install  1 Package (+3 Dependent packages)
    ansible:
    ansible: Total download size: 9.3 M
    ansible: Installed size: 47 M
    ansible: Downloading packages:
    ansible: Public key for python3-3.6.8-21.el7_9.x86_64.rpm is not installed
    ansible: warning: /var/cache/yum/x86_64/7/updates/packages/python3-3.6.8-21.el7_9.x86_64.rpm: Header V4 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
    ansible: Public key for python3-setuptools-39.2.0-10.el7.noarch.rpm is not installed
    ansible: --------------------------------------------------------------------------------
    ansible: Total                                              3.5 MB/s | 9.3 MB  00:02
    ansible: Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
    ansible: Importing GPG key 0xF4A80EB5:
    ansible:  Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
    ansible:  Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
    ansible:  Package    : centos-release-7-8.2003.0.el7.centos.x86_64 (@anaconda)
    ansible:  From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
    ansible: Running transaction check
    ansible: Running transaction test
    ansible: Transaction test succeeded
    ansible: Running transaction
    ansible:   Installing : python3-setuptools-39.2.0-10.el7.noarch                      1/4
    ansible:   Installing : python3-pip-9.0.3-8.el7.noarch                               2/4
    ansible:   Installing : python3-3.6.8-21.el7_9.x86_64                                3/4
    ansible:   Installing : python3-libs-3.6.8-21.el7_9.x86_64                           4/4
    ansible:   Verifying  : python3-libs-3.6.8-21.el7_9.x86_64                           1/4
    ansible:   Verifying  : python3-3.6.8-21.el7_9.x86_64                                2/4
    ansible:   Verifying  : python3-setuptools-39.2.0-10.el7.noarch                      3/4
    ansible:   Verifying  : python3-pip-9.0.3-8.el7.noarch                               4/4
    ansible:
    ansible: Installed:
    ansible:   python3.x86_64 0:3.6.8-21.el7_9
    ansible: 
    ansible: Dependency Installed:
    ansible:   python3-libs.x86_64 0:3.6.8-21.el7_9        python3-pip.noarch 0:9.0.3-8.el7
    ansible:   python3-setuptools.noarch 0:39.2.0-10.el7
    ansible:
    ansible: Complete!
    ansible: Loaded plugins: fastestmirror
    ansible: Loading mirror speeds from cached hostfile
    ansible:  * base: ftp.nsc.ru
    ansible:  * extras: ftp.nsc.ru
    ansible:  * updates: ftp.nsc.ru
    ansible: Resolving Dependencies
    ansible: --> Running transaction check
    ansible: ---> Package epel-release.noarch 0:7-11 will be installed
    ansible: --> Finished Dependency Resolution
    ansible: 
    ansible: Dependencies Resolved
    ansible:
    ansible: ================================================================================
    ansible:  Package                Arch             Version         Repository        Size
    ansible: ================================================================================
    ansible: Installing:
    ansible:  epel-release           noarch           7-11            extras            15 k
    ansible:
    ansible: Transaction Summary
    ansible: ================================================================================
    ansible: Install  1 Package
    ansible:
    ansible: Total download size: 15 k
    ansible: Installed size: 24 k
    ansible: Downloading packages:
    ansible: Running transaction check
    ansible: Running transaction test
    ansible: Transaction test succeeded
    ansible: Running transaction
    ansible:   Installing : epel-release-7-11.noarch                                     1/1
    ansible:   Verifying  : epel-release-7-11.noarch                                     1/1
    ansible:
    ansible: Installed:
    ansible:   epel-release.noarch 0:7-11
    ansible:
    ansible: Complete!
    ansible: Loaded plugins: fastestmirror
    ansible: Loading mirror speeds from cached hostfile
    ansible:  * base: ftp.nsc.ru
    ansible:  * epel: ftp.nsc.ru
    ansible:  * extras: ftp.nsc.ru
    ansible:  * updates: ftp.nsc.ru
    ansible: Resolving Dependencies
    ansible: --> Running transaction check
    ansible: ---> Package ansible.noarch 0:2.9.27-1.el7 will be installed
    ansible: --> Processing Dependency: PyYAML for package: ansible-2.9.27-1.el7.noarch
    ansible: --> Processing Dependency: python-httplib2 for package: ansible-2.9.27-1.el7.noarch
    ansible: --> Processing Dependency: python-jinja2 for package: ansible-2.9.27-1.el7.noarch
    ansible: --> Processing Dependency: python-paramiko for package: ansible-2.9.27-1.el7.noarch
    ansible: --> Processing Dependency: python-setuptools for package: ansible-2.9.27-1.el7.noarch
    ansible: --> Processing Dependency: python-six for package: ansible-2.9.27-1.el7.noarch
    ansible: --> Processing Dependency: python2-cryptography for package: ansible-2.9.27-1.el7.noarch
    ansible: --> Processing Dependency: python2-jmespath for package: ansible-2.9.27-1.el7.noarch
    ansible: --> Processing Dependency: sshpass for package: ansible-2.9.27-1.el7.noarch
    ansible: --> Running transaction check
    ansible: ---> Package PyYAML.x86_64 0:3.10-11.el7 will be installed
    ansible: --> Processing Dependency: libyaml-0.so.2()(64bit) for package: PyYAML-3.10-11.el7.x86_64
    ansible: ---> Package python-jinja2.noarch 0:2.7.2-4.el7 will be installed
    ansible: --> Processing Dependency: python-babel >= 0.8 for package: python-jinja2-2.7.2-4.el7.noarch
    ansible: --> Processing Dependency: python-markupsafe for package: python-jinja2-2.7.2-4.el7.noarch
    ansible: ---> Package python-paramiko.noarch 0:2.1.1-9.el7 will be installed
    ansible: --> Processing Dependency: python2-pyasn1 for package: python-paramiko-2.1.1-9.el7.noarch
    ansible: ---> Package python-setuptools.noarch 0:0.9.8-7.el7 will be installed
    ansible: --> Processing Dependency: python-backports-ssl_match_hostname for package: python-setuptools-0.9.8-7.el7.noarch
    ansible: ---> Package python-six.noarch 0:1.9.0-2.el7 will be installed
    ansible: ---> Package python2-cryptography.x86_64 0:1.7.2-2.el7 will be installed
    ansible: --> Processing Dependency: python-idna >= 2.0 for package: python2-cryptography-1.7.2-2.el7.x86_64
    ansible: --> Processing Dependency: python-cffi >= 1.4.1 for package: python2-cryptography-1.7.2-2.el7.x86_64
    ansible: --> Processing Dependency: python-ipaddress for package: python2-cryptography-1.7.2-2.el7.x86_64
    ansible: --> Processing Dependency: python-enum34 for package: python2-cryptography-1.7.2-2.el7.x86_64
    ansible: ---> Package python2-httplib2.noarch 0:0.18.1-3.el7 will be installed
    ansible: ---> Package python2-jmespath.noarch 0:0.9.4-2.el7 will be installed
    ansible: ---> Package sshpass.x86_64 0:1.06-2.el7 will be installed
    ansible: --> Running transaction check
    ansible: ---> Package libyaml.x86_64 0:0.1.4-11.el7_0 will be installed
    ansible: ---> Package python-babel.noarch 0:0.9.6-8.el7 will be installed
    ansible: ---> Package python-backports-ssl_match_hostname.noarch 0:3.5.0.1-1.el7 will be installed
    ansible: --> Processing Dependency: python-backports for package: python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch
    ansible: ---> Package python-cffi.x86_64 0:1.6.0-5.el7 will be installed
    ansible: --> Processing Dependency: python-pycparser for package: python-cffi-1.6.0-5.el7.x86_64
    ansible: ---> Package python-enum34.noarch 0:1.0.4-1.el7 will be installed
    ansible: ---> Package python-idna.noarch 0:2.4-1.el7 will be installed
    ansible: ---> Package python-ipaddress.noarch 0:1.0.16-2.el7 will be installed
    ansible: ---> Package python-markupsafe.x86_64 0:0.11-10.el7 will be installed
    ansible: ---> Package python2-pyasn1.noarch 0:0.1.9-7.el7 will be installed
    ansible: --> Running transaction check
    ansible: ---> Package python-backports.x86_64 0:1.0-8.el7 will be installed
    ansible: ---> Package python-pycparser.noarch 0:2.14-1.el7 will be installed
    ansible: --> Processing Dependency: python-ply for package: python-pycparser-2.14-1.el7.noarch
    ansible: --> Running transaction check
    ansible: ---> Package python-ply.noarch 0:3.4-11.el7 will be installed
    ansible: --> Finished Dependency Resolution
    ansible: 
    ansible: Dependencies Resolved
    ansible:
    ansible: ================================================================================
    ansible:  Package                               Arch     Version          Repository
    ansible:                                                                            Size
    ansible: ================================================================================
    ansible: Installing:
    ansible:  ansible                               noarch   2.9.27-1.el7     epel      17 M
    ansible: Installing for dependencies:
    ansible:  PyYAML                                x86_64   3.10-11.el7      base     153 k
    ansible:  libyaml                               x86_64   0.1.4-11.el7_0   base      55 k
    ansible:  python-babel                          noarch   0.9.6-8.el7      base     1.4 M
    ansible:  python-backports                      x86_64   1.0-8.el7        base     5.8 k
    ansible:  python-backports-ssl_match_hostname   noarch   3.5.0.1-1.el7    base      13 k
    ansible:  python-cffi                           x86_64   1.6.0-5.el7      base     218 k
    ansible:  python-enum34                         noarch   1.0.4-1.el7      base      52 k
    ansible:  python-idna                           noarch   2.4-1.el7        base      94 k
    ansible:  python-ipaddress                      noarch   1.0.16-2.el7     base      34 k
    ansible:  python-jinja2                         noarch   2.7.2-4.el7      base     519 k
    ansible:  python-markupsafe                     x86_64   0.11-10.el7      base      25 k
    ansible:  python-paramiko                       noarch   2.1.1-9.el7      base     269 k
    ansible:  python-ply                            noarch   3.4-11.el7       base     123 k
    ansible:  python-pycparser                      noarch   2.14-1.el7       base     104 k
    ansible:  python-setuptools                     noarch   0.9.8-7.el7      base     397 k
    ansible:  python-six                            noarch   1.9.0-2.el7      base      29 k
    ansible:  python2-cryptography                  x86_64   1.7.2-2.el7      base     502 k
    ansible:  python2-httplib2                      noarch   0.18.1-3.el7     epel     125 k
    ansible:  python2-jmespath                      noarch   0.9.4-2.el7      epel      41 k
    ansible:  python2-pyasn1                        noarch   0.1.9-7.el7      base     100 k
    ansible:  sshpass                               x86_64   1.06-2.el7       extras    21 k
    ansible:
    ansible: Transaction Summary
    ansible: ================================================================================
    ansible: Install  1 Package (+21 Dependent packages)
    ansible:
    ansible: Total download size: 21 M
    ansible: Installed size: 122 M
    ansible: Downloading packages:
    ansible: Public key for ansible-2.9.27-1.el7.noarch.rpm is not installed
    ansible: warning: /var/cache/yum/x86_64/7/epel/packages/ansible-2.9.27-1.el7.noarch.rpm: Header V4 RSA/SHA256 Signature, key ID 352c64e5: NOKEY
    ansible: --------------------------------------------------------------------------------
    ansible: Total                                              5.0 MB/s |  21 MB  00:04
    ansible: Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
    ansible: Importing GPG key 0x352C64E5:
    ansible:  Userid     : "Fedora EPEL (7) <epel@fedoraproject.org>"
    ansible:  Fingerprint: 91e9 7d7c 4a5e 96f1 7f3e 888f 6a2f aea2 352c 64e5
    ansible:  Package    : epel-release-7-11.noarch (@extras)
    ansible:  From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
    ansible: Running transaction check
    ansible: Running transaction test
    ansible: Transaction test succeeded
    ansible: Running transaction
    ansible:   Installing : python2-pyasn1-0.1.9-7.el7.noarch                           1/22
    ansible:   Installing : python-ipaddress-1.0.16-2.el7.noarch                        2/22
    ansible:   Installing : python-six-1.9.0-2.el7.noarch                               3/22
    ansible:   Installing : sshpass-1.06-2.el7.x86_64                                   4/22
    ansible:   Installing : libyaml-0.1.4-11.el7_0.x86_64                               5/22
    ansible:   Installing : PyYAML-3.10-11.el7.x86_64                                   6/22
    ansible:   Installing : python-backports-1.0-8.el7.x86_64                           7/22
    ansible:   Installing : python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch    8/22
    ansible:   Installing : python-setuptools-0.9.8-7.el7.noarch                        9/22
    ansible:   Installing : python2-httplib2-0.18.1-3.el7.noarch                       10/22
    ansible:   Installing : python-babel-0.9.6-8.el7.noarch                            11/22
    ansible:   Installing : python2-jmespath-0.9.4-2.el7.noarch                        12/22
    ansible:   Installing : python-ply-3.4-11.el7.noarch                               13/22
    ansible:   Installing : python-pycparser-2.14-1.el7.noarch                         14/22
    ansible:   Installing : python-cffi-1.6.0-5.el7.x86_64                             15/22
    ansible:   Installing : python-markupsafe-0.11-10.el7.x86_64                       16/22
    ansible:   Installing : python-jinja2-2.7.2-4.el7.noarch                           17/22
    ansible:   Installing : python-idna-2.4-1.el7.noarch                               18/22
    ansible:   Installing : python-enum34-1.0.4-1.el7.noarch                           19/22
    ansible:   Installing : python2-cryptography-1.7.2-2.el7.x86_64                    20/22
    ansible:   Installing : python-paramiko-2.1.1-9.el7.noarch                         21/22
    ansible:   Installing : ansible-2.9.27-1.el7.noarch                                22/22
    ansible:   Verifying  : python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch    1/22
    ansible:   Verifying  : python-enum34-1.0.4-1.el7.noarch                            2/22
    ansible:   Verifying  : python-setuptools-0.9.8-7.el7.noarch                        3/22
    ansible:   Verifying  : python-paramiko-2.1.1-9.el7.noarch                          4/22
    ansible:   Verifying  : python-jinja2-2.7.2-4.el7.noarch                            5/22
    ansible:   Verifying  : python-six-1.9.0-2.el7.noarch                               6/22
    ansible:   Verifying  : python-idna-2.4-1.el7.noarch                                7/22
    ansible:   Verifying  : python-markupsafe-0.11-10.el7.x86_64                        8/22
    ansible:   Verifying  : python-ply-3.4-11.el7.noarch                                9/22
    ansible:   Verifying  : ansible-2.9.27-1.el7.noarch                                10/22
    ansible:   Verifying  : python2-jmespath-0.9.4-2.el7.noarch                        11/22
    ansible:   Verifying  : python-babel-0.9.6-8.el7.noarch                            12/22
    ansible:   Verifying  : python2-httplib2-0.18.1-3.el7.noarch                       13/22
    ansible:   Verifying  : python-backports-1.0-8.el7.x86_64                          14/22
    ansible:   Verifying  : python-cffi-1.6.0-5.el7.x86_64                             15/22
    ansible:   Verifying  : python-pycparser-2.14-1.el7.noarch                         16/22
    ansible:   Verifying  : libyaml-0.1.4-11.el7_0.x86_64                              17/22
    ansible:   Verifying  : python-ipaddress-1.0.16-2.el7.noarch                       18/22
    ansible:   Verifying  : sshpass-1.06-2.el7.x86_64                                  19/22
    ansible:   Verifying  : python2-pyasn1-0.1.9-7.el7.noarch                          20/22
    ansible:   Verifying  : PyYAML-3.10-11.el7.x86_64                                  21/22
    ansible:   Verifying  : python2-cryptography-1.7.2-2.el7.x86_64                    22/22
    ansible:
    ansible: Installed:
    ansible:   ansible.noarch 0:2.9.27-1.el7
    ansible:
    ansible: Dependency Installed:
    ansible:   PyYAML.x86_64 0:3.10-11.el7
    ansible:   libyaml.x86_64 0:0.1.4-11.el7_0
    ansible:   python-babel.noarch 0:0.9.6-8.el7
    ansible:   python-backports.x86_64 0:1.0-8.el7
    ansible:   python-backports-ssl_match_hostname.noarch 0:3.5.0.1-1.el7
    ansible:   python-cffi.x86_64 0:1.6.0-5.el7
    ansible:   python-enum34.noarch 0:1.0.4-1.el7
    ansible:   python-idna.noarch 0:2.4-1.el7
    ansible:   python-ipaddress.noarch 0:1.0.16-2.el7
    ansible:   python-jinja2.noarch 0:2.7.2-4.el7
    ansible:   python-markupsafe.x86_64 0:0.11-10.el7
    ansible:   python-paramiko.noarch 0:2.1.1-9.el7
    ansible:   python-ply.noarch 0:3.4-11.el7
    ansible:   python-pycparser.noarch 0:2.14-1.el7
    ansible:   python-setuptools.noarch 0:0.9.8-7.el7
    ansible:   python-six.noarch 0:1.9.0-2.el7
    ansible:   python2-cryptography.x86_64 0:1.7.2-2.el7
    ansible:   python2-httplib2.noarch 0:0.18.1-3.el7
    ansible:   python2-jmespath.noarch 0:0.9.4-2.el7
    ansible:   python2-pyasn1.noarch 0:0.1.9-7.el7
    ansible:   sshpass.x86_64 0:1.06-2.el7
    ansible:
    ansible: Complete!
==> ansible: Running provisioner: file...
    ansible: inventories => inventories
==> ansible: Running provisioner: file...
    ansible: playbooks => playbooks
```