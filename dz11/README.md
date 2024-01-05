# Домашнее задание 11. Работа с процессами

## Задание на выбор:

1. **написать свою реализацию ps ax используя анализ /proc
Результат ДЗ - рабочий скрипт который можно запустить**
2. написать свою реализацию lsof
Результат ДЗ - рабочий скрипт который можно запустить
3. дописать обработчики сигналов в прилагаемом скрипте, оттестировать, приложить сам скрипт, инструкции по использованию
Результат ДЗ - рабочий скрипт который можно запустить + инструкция по использованию и лог консоли
4. реализовать 2 конкурирующих процесса по IO. пробовать запустить с разными ionice
Результат ДЗ - скрипт запускающий 2 процесса с разными ionice, замеряющий время выполнения и лог консоли
5. реализовать 2 конкурирующих процесса по CPU. пробовать запустить с разными nice
Результат ДЗ - скрипт запускающий 2 процесса с разными nice и замеряющий время выполнения и лог консоли

# Решение

Выбрал первое задание.

[script.sh](./script.sh)

Результат работы скрипта на одном из серверов разработки под RedOS:

```bash
PID     TTY        CMD                            STATE      RSS kb     USER
1                  (systemd)                      S          13312      root
10                 (mm_percpu_wq)                 I          0          root
100                (migration/17)                 S          0          root
101                (ksoftirqd/17)                 S          0          root
1010               (kworker/10:1H-kblockd)        I          0          root
103                (kworker/17:0H-kblockd)        I          0          root
104                (cpuhp/18)                     S          0          root
105                (migration/18)                 S          0          root
106                (ksoftirqd/18)                 S          0          root
1064               (kworker/7:1H-kblockd)         I          0          root
108                (kworker/18:0H-events_highpri) I          0          root
1087               (kworker/14:1H-kblockd)        I          0          root
1089               (kworker/23:1H-kblockd)        I          0          root
109                (cpuhp/19)                     S          0          root
1091               (kworker/17:1H-kblockd)        I          0          root
11                 (rcu_tasks_kthre)              S          0          root
110                (migration/19)                 S          0          root
1100               (kworker/26:1H-kblockd)        I          0          root
111                (ksoftirqd/19)                 S          0          root
1120               (systemd-journal)              S          60312      root
...
2592884            (oracle_2592884_)              S          112884     oracle
2597971            (bshell6.2)                    S          77004      konovalenko_gn
2598237            (oracle_2598237_)              S          271944     oracle
2604               (Xorg)                         S          10028      root
2618080            (kworker/u65:0-flush-253:7)    I          0          root
2618591            (kworker/u66:3-flush-253:0)    I          0          root
2618622            (kworker/u66:4-flush-253:0)    I          0          root
2618806            (kworker/26:0-ata_sff)         I          0          root
2618985            (kworker/16:1-events)          I          0          root
2619396            (kworker/u65:5-flush-253:9)    I          0          root
2619518            (kworker/u65:6-flush-253:2)    I          0          root
262                (kthrotld)                     I          0          root
2622743            (pickup)                       S          9568       postfix
2623923            (kworker/u65:7-writeback)      I          0          root
2624008            (systemd-userwor)              S          8092       root
2624509            (systemd-userwor)              S          8024       root
2624592            (bshell6.2)                    S          72252      krumm_di
2624609            (oracle_2624609_)              S          243708     oracle
2624648            (kworker/u65:9-flush-253:9)    I          0          root
2624727            (systemd-userwor)              S          8192       root
2625251            (bshell6.2)                    S          84856      seredin_sm
2625272            (oracle_2625272_)              S          514800     oracle
2626907            (systemd)                      S          13544      barcode
2626912            ((sd-pam))                     S          1584       barcode
2626919            (pipewire)                     S          4852       barcode
...
937733             (sshd)                         S          7832       root
94                 (migration/16)                 S          0          root
942849             (sshd)                         S          10864      root
942895             (sshd)                         S          9564       root
942900             (systemd)                      S          13944      ora193
942904             ((sd-pam))                     S          5504       ora193
942918             (pipewire)                     S          5852       ora193
942919             (pulseaudio)                   S          6408       ora193
942922             (dbus-broker-lau)              S          3880       ora193
942925             (dbus-broker)                  S          1472       ora193
942926             (sshd)                         S          6692       ora193
942927             (pipewire-media-)              S          6804       ora193
942931             (sshd)                         S          5708       ora193
942938             (sftp-server)                  S          4552       ora193
942990             (bash)                         S          4912       ora193
945033             (kworker/19:2-events)          I          0          root
95                 (ksoftirqd/16)                 S          0          root
966                (kdmflush)                     I          0          root
97                 (kworker/16:0H-events_highpri) I          0          root
975                (kdmflush)                     I          0          root
99                 (cpuhp/17)                     S          0          root
990584             (ora_m004_ln19)                S          5804868    oracle
991                (kworker/9:1H-kblockd)         I          0          root
997                (jbd2/dm-0-8)                  S          0          root
998                (ext4-rsv-conver)              I          0          root
```

Имя пользователя USER подтягивается как из /etc/passwd так и из Active Directory.