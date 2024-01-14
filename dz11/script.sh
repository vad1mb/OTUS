#!/bin/bash

# Заголовок таблицы
printf "%-7s %-10s %-30s %-10s %-10s %-20s\n" "PID" "TTY" "CMD" "STATE" "RSS kb" "USER"

# Размер страницы памяти в байтах
page_size=$(getconf PAGESIZE)

# Цикл по всем процессам в /proc
for pid in /proc/*/; do
    # Извлекаем идентификатор процесса из пути
    pid=$(basename "$pid")

    # Проверяем, является ли имя папки числовым идентификатором процесса
    if [[ "$pid" =~ ^[0-9]+$ ]] && [ -d "/proc/$pid" ]; then
        # Извлекаем необходимую информацию из файла /proc/<pid>/stat
        read -r pid comm state ppid tty_nr rest <<< $(awk '{print $1, $2, $3, $4, $7}' /proc/$pid/stat 2>/dev/null)
        # Извлекаем номер терминала
        tty_nr=$(basename "$(readlink -e /proc/$pid/fd/0)")
        # Извлекаем кол-во страниц занимаемой в физической памяти
        rss=$(awk '{print $2}' /proc/$pid/statm)
        # Преобразуем в размер в kb
        rss_kb=$((rss * page_size / 1024))
        # Извлекаем имя пользователя
        user=$(getent passwd $(ps -o uid= -p "$pid") | cut -d : -f 1)
        # Выводим информацию в табличном виде
        printf "%-7s %-10s %-30s %-10s %-10s %-20s\n" "$pid" "$tty_nr" "$comm" "$state" "$rss_kb" "$user"
    fi
done

