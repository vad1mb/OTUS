# Домашнее задание 22. VPN

**Цель:**

Создать домашнюю сетевую лабораторию. Научится настраивать VPN-сервер в Linux-based системах.

**Что нужно сделать?**

1. Настроить VPN между двумя ВМ в tun/tap режимах, замерить скорость в туннелях, сделать вывод об отличающихся показателях
2. Поднять RAS на базе OpenVPN с клиентскими сертификатами, подключиться с локальной машины на ВМ

Задание со звездочкой

1. Самостоятельно изучить и настроить ocserv, подключиться с хоста к ВМ

Формат сдачи ДЗ - vagrant + ansible

## Решение

### Подготовка

<aside>
💡 Некоторое отступление:

Так как мой ПК не поддерживает встроенную виртуализацию Nested VT-x, пришлось добавить еще одну ВМ **ansible** для управления. 

</aside>

Скопировать содержимое каталога выполнить загрузку ВМ

```bash
vagrant up
```

Подключиться к ВМ ansible и запустить плейбук

```bash
vagrant ssh ansible

cd /vagrant/ansible
ansible-playbook ./provision.yml -i ./hosts
```

### На ВМ server

Создаем файл-ключ

```bash
openvpn --genkey secret /etc/openvpn/static.key
```

Cоздаем конфигурационный файл OpenVPN /etc/openvpn/server.conf

```bash
tee <<EOF > /dev/null /etc/openvpn/server.conf
dev tap 
ifconfig 10.10.10.1 255.255.255.0 
topology subnet 
secret /etc/openvpn/static.key 
comp-lzo 
status /var/log/openvpn-status.log 
log /var/log/openvpn.log  
verb 3 
EOF
```

Создаем service unit для запуска OpenVPN

```bash
tee <<EOF > /dev/null /etc/systemd/system/openvpn@.service
[Unit] 
Description=OpenVPN Tunneling Application On %I 
After=network.target 
[Service] 
Type=notify 
PrivateTmp=true 
ExecStart=/usr/sbin/openvpn --cd /etc/openvpn/ --config %i.conf 
[Install] 
WantedBy=multi-user.target
EOF
```

Автозапуск сервиса

```bash
root@server:/etc/openvpn# systemctl daemon-reload
root@server:/etc/openvpn# systemctl enable openvpn@server
root@server:/etc/openvpn# systemctl restart openvpn@server
```

### На ВМ client

Создаем конфигурационный файл OpenVPN

```bash
tee <<EOF > /dev/null /etc/openvpn/server.conf
dev tap 
remote 192.168.50.10 
ifconfig 10.10.10.2 255.255.255.0 
topology subnet 
route 192.168.50.0 255.255.255.0 
secret /etc/openvpn/static.key
comp-lzo
status /var/log/openvpn-status.log 
log /var/log/openvpn.log 
verb 3
EOF
```

На ВМ client в директорию /etc/openvpn необходимо скопировать файл-ключ static.key, который был создан на ВМ server.

 Создаем service unit для запуска OpenVPN

```bash
tee <<EOF > /dev/null /etc/systemd/system/openvpn@.service
[Unit] 
Description=OpenVPN Tunneling Application On %I 
After=network.target 
[Service] 
Type=notify 
PrivateTmp=true 
ExecStart=/usr/sbin/openvpn --cd /etc/openvpn/ --config %i.conf 
[Install] 
WantedBy=multi-user.target
EOF
```

Автозапуск сервиса

```bash
root@client:/etc/openvpn# systemctl daemon-reload
root@client:/etc/openvpn# systemctl enable openvpn@server
root@client:/etc/openvpn# systemctl restart openvpn@server
```

### Проверка скорости

Проверка скорости для tap

```bash
root@client:~# iperf3 -c 10.10.10.1 -t 40 -i 5
Connecting to host 10.10.10.1, port 5201
[  5] local 10.10.10.2 port 51096 connected to 10.10.10.1 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-5.00   sec  28.3 MBytes  47.5 Mbits/sec    9    213 KBytes
[  5]   5.00-10.00  sec  24.5 MBytes  41.1 Mbits/sec    0    283 KBytes       
[  5]  10.00-15.00  sec  23.8 MBytes  40.0 Mbits/sec   65    279 KBytes       
[  5]  15.00-20.00  sec  22.4 MBytes  37.6 Mbits/sec  100    200 KBytes       
[  5]  20.00-25.00  sec  28.4 MBytes  47.6 Mbits/sec    3    230 KBytes       
[  5]  25.00-30.00  sec  25.4 MBytes  42.7 Mbits/sec   47    183 KBytes       
[  5]  30.00-35.00  sec  29.0 MBytes  48.7 Mbits/sec    0    266 KBytes       
^C [  5]  35.00-36.18  sec  6.79 MBytes  48.1 Mbits/sec    0    284 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-36.18  sec   189 MBytes  43.7 Mbits/sec  224             sender
[  5]   0.00-36.18  sec  0.00 Bytes  0.00 bits/sec                  receiver
iperf3: interrupt - the client has terminated
```

Проверка скорости для tun

```bash
root@client:~# iperf3 -c 10.10.10.1 -t 40 -i 5
Connecting to host 10.10.10.1, port 5201
[  5] local 10.10.10.2 port 47322 connected to 10.10.10.1 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-5.00   sec  22.9 MBytes  38.5 Mbits/sec   33    229 KBytes
[  5]   5.00-10.00  sec  22.7 MBytes  38.0 Mbits/sec   24    165 KBytes       
[  5]  10.00-15.00  sec  27.7 MBytes  46.6 Mbits/sec   42    169 KBytes       
[  5]  15.00-20.00  sec  29.5 MBytes  49.5 Mbits/sec    0    267 KBytes       
[  5]  20.00-25.00  sec  26.3 MBytes  44.2 Mbits/sec   21    267 KBytes       
[  5]  25.00-30.00  sec  29.0 MBytes  48.7 Mbits/sec   82    139 KBytes       
[  5]  30.00-35.01  sec  27.7 MBytes  46.5 Mbits/sec    5    135 KBytes       
[  5]  35.01-40.00  sec  28.7 MBytes  48.3 Mbits/sec   18    169 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-40.00  sec   215 MBytes  45.0 Mbits/sec  225             sender
[  5]   0.00-40.05  sec   214 MBytes  44.8 Mbits/sec                  receiver

iperf Done.
```

Отличия по скорости незначительные.

### **RAS на базе OpenVPN**

<aside>
💡 В методичке в качестве хоста используется Linux. У меня - Windows.
По этому настройку буду делать между ВМ server и ansible

</aside>

### На ВМ server

Инициализируем PKI

```bash
root@server:~# cd /etc/openvpn
root@server:/etc/openvpn# /usr/share/easy-rsa/easyrsa init-pki

init-pki complete; you may now create a CA or requests.
Your newly created PKI dir is: /etc/openvpn/pki
```

Генерируем необходимые ключи и сертификаты для сервера

```bash
# Корневой сертификат ca.crt. Почему-то этот шаг не указан в методичке.
echo 'yes' | /usr/share/easy-rsa/easyrsa build-ca nopass
Using SSL: openssl OpenSSL 3.0.2 15 Mar 2022 (Library: OpenSSL 3.0.2 15 Mar 2022)
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Common Name (eg: your user, host, or server name) [Easy-RSA CA]:
CA creation complete and you may now import and sign cert requests.
Your new CA certificate file for publishing is at:
/etc/openvpn/pki/ca.crt

# Генерация сертификата
# Здесь 'rasvpn' это пароль через конвейер команде easyrsa gen-req server nopass, чтобы избежать запроса пароля во время генерации.
root@server:/etc/openvpn# **echo 'rasvpn' | /usr/share/easy-rsa/easyrsa gen-req server nopass**  
Using SSL: openssl OpenSSL 3.0.2 15 Mar 2022 (Library: OpenSSL 3.0.2 15 Mar 2022)
......+.+......+..+...+....+.....+.+.........+...........+...+......+.+.....+..
8<cut>8
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Common Name (eg: your user, host, or server name) [server]:
Keypair and certificate request completed. Your files are:
req: /etc/openvpn/pki/reqs/server.req
key: /etc/openvpn/pki/private/server.key

# Подписание сертификата
root@server:/etc/openvpn# **echo 'yes' | /usr/share/easy-rsa/easyrsa sign-req server server**
Using SSL: openssl OpenSSL 3.0.2 15 Mar 2022 (Library: OpenSSL 3.0.2 15 Mar 2022)

You are about to sign the following certificate.
Please check over the details shown below for accuracy. Note that this request
has not been cryptographically verified. Please be sure it came from a trusted
source or that you have verified the request checksum with the sender.

Request subject, to be signed as a server certificate for 825 days:

subject=
    commonName                = rasvpn

Type the word 'yes' to continue, or any other input to abort.
  Confirm request details: Using configuration from /etc/openvpn/pki/easy-rsa-6532.2USGpc/tmp.eknxo3
40E7FD49AA7F0000:error:0700006C:configuration file routines:NCONF_get_string:no value:../crypto/conf/conf_lib.c:315:group=<NULL> name=unique_subject
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
commonName            :ASN.1 12:'rasvpn'
Certificate is to be certified until Jul 23 03:55:39 2026 GMT (825 days)

Write out database with 1 new entries
Data Base Updated

Certificate created at: /etc/openvpn/pki/issued/server.crt

#  Генерации параметров обмена ключами Diffie-Hellman (DH) с использованием сценария Easy-RSA
root@server:/etc/openvpn# /usr/share/easy-rsa/easyrsa gen-dh
Using SSL: openssl OpenSSL 3.0.2 15 Mar 2022 (Library: OpenSSL 3.0.2 15 Mar 2022)
Generating DH parameters, 2048 bit long safe prime
...........................................................................
8<cut>8
++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*

DH parameters of size 2048 created at /etc/openvpn/pki/dh.pem

# Генерации ключа шифрования для OpenVPN 
root@server:/etc/openvpn# **openvpn --genkey secret ca.key**
root@server:/etc/openvpn# ls -l
total 28
-rw------- 1 root root  636 Apr 19 04:05 ca.key
drwxr-xr-x 2 root root 4096 Sep 29  2023 client
drwx------ 8 root root 4096 Apr 19 04:00 pki
drwxr-xr-x 2 root root 4096 Sep 29  2023 server
-rw-r--r-- 1 root root  174 Apr 18 13:31 server.conf
-rw------- 1 root root  636 Apr 18 13:00 static.key
-rwxr-xr-x 1 root root 1468 Sep 29  2023 update-resolv-conf
```

Там же на server генерируем необходимые ключи и сертификаты для клиента

```bash
# Генрируем сертификат для клиента
root@server:/etc/openvpn# echo 'client' | /usr/share/easy-rsa/easyrsa gen-req client nopass
Using SSL: openssl OpenSSL 3.0.2 15 Mar 2022 (Library: OpenSSL 3.0.2 15 Mar 2022)
..+.............+..+.......+........+............+.+..+....+.....+....+.....+.++++++++++++++++
8<cut>8
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Common Name (eg: your user, host, or server name) [client]:
Keypair and certificate request completed. Your files are:
req: /etc/openvpn/pki/reqs/client.req
key: /etc/openvpn/pki/private/client.key

# Подписываем его
root@server:/etc/openvpn# echo 'yes' | /usr/share/easy-rsa/easyrsa sign-req client client
Using SSL: openssl OpenSSL 3.0.2 15 Mar 2022 (Library: OpenSSL 3.0.2 15 Mar 2022)

You are about to sign the following certificate.
Please check over the details shown below for accuracy. Note that this request
has not been cryptographically verified. Please be sure it came from a trusted
source or that you have verified the request checksum with the sender.

Request subject, to be signed as a client certificate for 825 days:

subject=
    commonName                = client

Type the word 'yes' to continue, or any other input to abort.
  Confirm request details: Using configuration from /etc/openvpn/pki/easy-rsa-6635.T5UIWb/tmp.0PqDwv
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
commonName            :ASN.1 12:'client'
Certificate is to be certified until Jul 23 04:15:25 2026 GMT (825 days)

Write out database with 1 new entries
Data Base Updated

Certificate created at: /etc/openvpn/pki/issued/client.crt
```

Создаем конфигурационный файл сервера

```bash
tee <<EOF > /dev/null /etc/openvpn/server.conf
port 1207 
proto udp 
dev tun 
ca /etc/openvpn/pki/ca.crt 
cert /etc/openvpn/pki/issued/server.crt 
key /etc/openvpn/pki/private/server.key 
dh /etc/openvpn/pki/dh.pem 
server 10.10.10.0 255.255.255.0 
ifconfig-pool-persist ipp.txt 
client-to-client 
client-config-dir /etc/openvpn/client 
keepalive 10 120 
comp-lzo 
persist-key 
persist-tun 
status /var/log/openvpn-status.log 
log /var/log/openvpn.log 
verb 3
EOF
```

Применяем изменения и рестартуем сервис openvpn

```bash
root@server:/etc/openvpn# systemctl daemon-reload
root@server:/etc/openvpn# systemctl restart openvpn@server
root@server:/etc/openvpn# systemctl status openvpn@server
● openvpn@server.service - OpenVPN Tunneling Application On server
     Loaded: loaded (/etc/systemd/system/openvpn@.service; enabled; vendor preset: enabled)
     Active: active (running) since Fri 2024-04-19 13:43:24 UTC; 56s ago
   Main PID: 10285 (openvpn)
     Status: "Initialization Sequence Completed"
      Tasks: 1 (limit: 709)
     Memory: 1.8M
        CPU: 19ms
     CGroup: /system.slice/system-openvpn.slice/openvpn@server.service
             └─10285 /usr/sbin/openvpn --cd /etc/openvpn/ --config server.conf

Apr 19 13:43:24 server systemd[1]: Starting OpenVPN Tunneling Application On server...
Apr 19 13:43:24 server openvpn[10285]: 2024-04-19 13:43:24 WARNING: Compression for receiving enabled. Compression has >Apr 19 13:43:24 server systemd[1]: Started OpenVPN Tunneling Application On server.
```

Зададим параметр iroute для клиента

```bash
echo 'iroute 10.10.10.0 255.255.255.0' > /etc/openvpn/client/client
```

### На ВМ ansible

Создаем /etc/openvpn/client/client.conf - конфиг-файл клиента

```bash
tee <<EOF > /dev/null /etc/openvpn/client/client.conf
dev tun 
proto udp 
remote 192.168.56.10 1207 
client 
resolv-retry infinite 
remote-cert-tls server 
ca ./ca.crt 
cert ./client.crt 
key ./client.key 
route 192.168.56.0 255.255.255.0 
persist-key 
persist-tun 
comp-lzo 
verb 3 
EOF
```

С ВМ server копируем следующие файлы на ВМ ansible в /etc/openvpn/client/

/etc/openvpn/pki/ca.crt

/etc/openvpn/pki/issued/client.crt

/etc/openvpn/pki/private/client.key

### Проверка

С ВМ ansible инициируем подключение openvpn-клиента

```bash
root@ansible:/etc/openvpn/client# openvpn --config client.conf
2024-04-19 13:15:47 WARNING: Compression for receiving enabled. Compression has been used in the past to break encryption. Sent packets are not compressed unless "allow-compression yes" is also set.
2024-04-19 13:15:47 --cipher is not set. Previous OpenVPN version defaulted to BF-CBC as fallback when cipher negotiation failed in this case. If you need this fallback please add '--data-ciphers-fallback BF-CBC' to your configuration and/or add BF-CBC to --data-ciphers.
2024-04-19 13:15:47 WARNING: file './client.key' is group or others accessible
2024-04-19 13:15:47 OpenVPN 2.5.9 x86_64-pc-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL] [PKCS11] [MH/PKTINFO] [AEAD] built on Sep 29 2023
2024-04-19 13:15:47 library versions: OpenSSL 3.0.2 15 Mar 2022, LZO 2.10
2024-04-19 13:15:47 TCP/UDP: Preserving recently used remote address: [AF_INET]192.168.50.10:1207
2024-04-19 13:15:47 Socket Buffers: R=[212992->212992] S=[212992->212992]
2024-04-19 13:15:47 UDP link local (bound): [AF_INET][undef]:1194
2024-04-19 13:15:47 UDP link remote: [AF_INET]192.168.50.10:1207
2024-04-19 13:15:47 TLS: Initial packet from [AF_INET]192.168.50.10:1207, sid=ebd678f5 58b5d561
2024-04-19 13:15:47 VERIFY OK: depth=1, CN=yes
2024-04-19 13:15:47 VERIFY KU OK
2024-04-19 13:15:47 Validating certificate extended key usage
2024-04-19 13:15:47 ++ Certificate has EKU (str) TLS Web Server Authentication, expects TLS Web Server Authentication
2024-04-19 13:15:47 VERIFY EKU OK
2024-04-19 13:15:47 VERIFY OK: depth=0, CN=rasvpn
2024-04-19 13:15:47 Control Channel: TLSv1.3, cipher TLSv1.3 TLS_AES_256_GCM_SHA384, peer certificate: 2048 bit RSA, signature: RSA-SHA256
2024-04-19 13:15:47 [rasvpn] Peer Connection Initiated with [AF_INET]192.168.50.10:1207
2024-04-19 13:15:47 PUSH: Received control message: 'PUSH_REPLY,topology net30,ping 10,ping-restart 120,ifconfig 10.10.10.6 10.10.10.5,peer-id 0,cipher AES-256-GCM'
2024-04-19 13:15:47 OPTIONS IMPORT: timers and/or timeouts modified
2024-04-19 13:15:47 OPTIONS IMPORT: --ifconfig/up options modified
2024-04-19 13:15:47 OPTIONS IMPORT: peer-id set
2024-04-19 13:15:47 OPTIONS IMPORT: adjusting link_mtu to 1625
2024-04-19 13:15:47 OPTIONS IMPORT: data channel crypto options modified
2024-04-19 13:15:47 Data Channel: using negotiated cipher 'AES-256-GCM'
2024-04-19 13:15:47 Outgoing Data Channel: Cipher 'AES-256-GCM' initialized with 256 bit key
2024-04-19 13:15:47 Incoming Data Channel: Cipher 'AES-256-GCM' initialized with 256 bit key
2024-04-19 13:15:47 net_route_v4_best_gw query: dst 0.0.0.0
2024-04-19 13:15:47 net_route_v4_best_gw result: via 10.0.2.2 dev eth0
2024-04-19 13:15:47 ROUTE_GATEWAY 10.0.2.2/255.255.255.0 IFACE=eth0 HWADDR=08:00:27:8c:69:41
2024-04-19 13:15:47 TUN/TAP device tun0 opened
2024-04-19 13:15:47 net_iface_mtu_set: mtu 1500 for tun0
2024-04-19 13:15:47 net_iface_up: set tun0 up
2024-04-19 13:15:47 net_addr_ptp_v4_add: 10.10.10.6 peer 10.10.10.5 dev tun0
2024-04-19 13:15:47 net_route_v4_add: 192.168.50.0/24 via 10.10.10.5 dev [NULL] table 0 metric -1
2024-04-19 13:15:47 Initialization Sequence Completed

```

Со стороны openvpn-сервера наблюдаем в log-файле 

```bash
root@server:/etc/openvpn# tail -f /var/log/openvpn.log
2024-04-19 13:05:01 Socket Buffers: R=[212992->212992] S=[212992->212992]
2024-04-19 13:05:01 UDPv4 link local (bound): [AF_INET][undef]:1207
2024-04-19 13:05:01 UDPv4 link remote: [AF_UNSPEC]
2024-04-19 13:05:01 MULTI: multi_init called, r=256 v=256
2024-04-19 13:05:01 IFCONFIG POOL IPv4: base=10.10.10.4 size=62
2024-04-19 13:05:01 ifconfig_pool_read(), in='client,10.10.10.4,'
2024-04-19 13:05:01 succeeded -> ifconfig_pool_set(hand=0)
2024-04-19 13:05:01 IFCONFIG POOL LIST
2024-04-19 13:05:01 client,10.10.10.4,
2024-04-19 13:05:01 Initialization Sequence Completed
2024-04-19 13:15:47 192.168.50.250:1194 TLS: Initial packet from [AF_INET]192.168.50.250:1194, 
sid=03b3e1c7 2bd12fff
2024-04-19 13:15:47 192.168.50.250:1194 VERIFY OK: depth=1, CN=yes
2024-04-19 13:15:47 192.168.50.250:1194 VERIFY OK: depth=0, CN=client
2024-04-19 13:15:47 192.168.50.250:1194 peer info: IV_VER=2.5.9
2024-04-19 13:15:47 192.168.50.250:1194 peer info: IV_PLAT=linux
2024-04-19 13:15:47 192.168.50.250:1194 peer info: IV_PROTO=6
2024-04-19 13:15:47 192.168.50.250:1194 peer info: IV_NCP=2
2024-04-19 13:15:47 192.168.50.250:1194 peer info: IV_CIPHERS=AES-256-GCM:AES-128-GCM
2024-04-19 13:15:47 192.168.50.250:1194 peer info: IV_LZ4=1
2024-04-19 13:15:47 192.168.50.250:1194 peer info: IV_LZ4v2=1
2024-04-19 13:15:47 192.168.50.250:1194 peer info: IV_LZO=1
2024-04-19 13:15:47 192.168.50.250:1194 peer info: IV_COMP_STUB=1
2024-04-19 13:15:47 192.168.50.250:1194 peer info: IV_COMP_STUBv2=1
2024-04-19 13:15:47 192.168.50.250:1194 peer info: IV_TCPNL=1
2024-04-19 13:15:47 192.168.50.250:1194 Control Channel: TLSv1.3, cipher TLSv1.3 TLS_AES_256_GCM_SHA384, peer certificate: 2048 bit RSA, signature: RSA-SHA256
2024-04-19 13:15:47 192.168.50.250:1194 [client] Peer Connection Initiated with [AF_INET]192.168.50.250:1194
2024-04-19 13:15:47 client/192.168.50.250:1194 MULTI_sva: pool returned IPv4=10.10.10.6, IPv6=(Not enabled)
2024-04-19 13:15:47 client/192.168.50.250:1194 OPTIONS IMPORT: reading client specific options 
from: /etc/openvpn/client/client
2024-04-19 13:15:47 client/192.168.50.250:1194 MULTI: Learn: 10.10.10.6 -> client/192.168.50.250:1194
2024-04-19 13:15:47 client/192.168.50.250:1194 MULTI: primary virtual IP for client/192.168.50.250:1194: 10.10.10.6
2024-04-19 13:15:47 client/192.168.50.250:1194 MULTI: internal route 10.10.10.0/24 -> client/192.168.50.250:1194
2024-04-19 13:15:47 client/192.168.50.250:1194 MULTI: Learn: 10.10.10.0/24 -> client/192.168.50.250:1194
2024-04-19 13:15:47 client/192.168.50.250:1194 REMOVE PUSH ROUTE: 'route 10.10.10.0 255.255.255.0'
2024-04-19 13:15:47 client/192.168.50.250:1194 Data Channel: using negotiated cipher 'AES-256-GCM'
2024-04-19 13:15:47 client/192.168.50.250:1194 Outgoing Data Channel: Cipher 'AES-256-GCM' initialized with 256 bit key
2024-04-19 13:15:47 client/192.168.50.250:1194 Incoming Data Channel: Cipher 'AES-256-GCM' initialized with 256 bit key
2024-04-19 13:15:47 client/192.168.50.250:1194 SENT CONTROL [client]: 'PUSH_REPLY,topology net30,ping 10,ping-restart 120,ifconfig 10.10.10.6 10.10.10.5,peer-id 0,cipher AES-256-GCM' (status=1)
```

Интерфейсы на server

```bash
root@server:/etc/openvpn# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 
1000
    link/ether 08:00:27:3b:cf:90 brd ff:ff:ff:ff:ff:ff
    altname enp0s3
    inet 10.0.2.15/24 metric 100 brd 10.0.2.255 scope global dynamic eth0
       valid_lft 49580sec preferred_lft 49580sec
    inet6 fe80::a00:27ff:fe3b:cf90/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 
1000
    link/ether 08:00:27:f8:a6:f5 brd ff:ff:ff:ff:ff:ff
    altname enp0s16
    inet 192.168.50.10/24 brd 192.168.50.255 scope global eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fef8:a6f5/64 scope link
       valid_lft forever preferred_lft forever
8: tun0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UNKNOWN group 
default qlen 500
    link/none
    inet 10.10.10.1 peer 10.10.10.2/32 scope global tun0
       valid_lft forever preferred_lft forever
    inet6 fe80::1164:a09e:5ca9:5ae8/64 scope link stable-privacy
       valid_lft forever preferred_lft forever
```

Интерфейсы на клиенте (ВМ ansible)

```bash
root@ansible:/etc/openvpn/client# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 
1000
    link/ether 08:00:27:8c:69:41 brd ff:ff:ff:ff:ff:ff
    altname enp0s3
    inet 10.0.2.15/24 metric 100 brd 10.0.2.255 scope global dynamic eth0
       valid_lft 49425sec preferred_lft 49425sec
    inet6 fe80::a00:27ff:fe8c:6941/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 
1000
    link/ether 08:00:27:00:a7:42 brd ff:ff:ff:ff:ff:ff
    altname enp0s16
    inet 192.168.50.250/24 brd 192.168.50.255 scope global eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe00:a742/64 scope link
       valid_lft forever preferred_lft forever
5: tun0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UNKNOWN group 
default qlen 500
    link/none
    inet 10.10.10.6 peer 10.10.10.5/32 scope global tun0
       valid_lft forever preferred_lft forever
```

Пинги ходят, в таблице маршрутизации присутствует VPN-туннель

```bash
ping -c 4 10.10.10.1
PING 10.10.10.1 (10.10.10.1) 56(84) bytes of data.
64 bytes from 10.10.10.1: icmp_seq=1 ttl=64 time=0.041 ms
64 bytes from 10.10.10.1: icmp_seq=2 ttl=64 time=0.058 ms
64 bytes from 10.10.10.1: icmp_seq=3 ttl=64 time=0.062 ms
64 bytes from 10.10.10.1: icmp_seq=4 ttl=64 time=0.039 ms

--- 10.10.10.1 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3053ms
rtt min/avg/max/mdev = 0.039/0.050/0.062/0.010 ms

root@ansible:/etc/openvpn/client# ip r
default via 10.0.2.2 dev eth0 proto dhcp src 10.0.2.15 metric 100 
10.0.2.0/24 dev eth0 proto kernel scope link src 10.0.2.15 metric 100
10.0.2.2 dev eth0 proto dhcp scope link src 10.0.2.15 metric 100
10.0.2.3 dev eth0 proto dhcp scope link src 10.0.2.15 metric 100
10.10.10.5 dev tun0 proto kernel scope link src 10.10.10.6
192.168.50.0/24 via 10.10.10.5 dev tun0
```

---