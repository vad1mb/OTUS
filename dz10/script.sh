#!/bin/bash

EMAIL='email@example.ru'
DIR_DATA=./   # Задаем рабочую директорию 
access_log=$DIR_DATA/apache_logs.2
lock_file=$DIR_DATA'/filebash.lock'
date1=$(date +%Y%m%d-%H%M%S)
REPORT=$DIR_DATA'/log-'$date1'.txt'

# Проверка, что процесс не запущен
if [ -f "$lock_file" ]; then
  echo "Процесс уже запущен"
  exit 1
fi

# Создаем файл-метку запущенного процесса
touch $lock_file

## Определяем временной диапазон в log-файле
echo > $REPORT
echo "Временной диапазон лог-файла" >> $REPORT
echo "--------------------------------------------------" >> $REPORT
# Вариант через sed
#cat $access_log | awk '{print $4}' | cut -c 2-| sed -n '1p;$p' >> $REPORT
# Вариант через head/tail
cat $access_log | head -n1 | awk '{print $4}'| cut -c 2- >> $REPORT
cat $access_log | tail -n1 | awk '{print $4}'| cut -c 2- >> $REPORT
echo >> $REPORT

echo "Top 10 IP-адресов с наибольшим кол-вом запросов" >> $REPORT
echo "--------------------------------------------------" >> $REPORT
cat $access_log | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 10 >> $REPORT
echo >> $REPORT

echo "Top 10 запрашиваемых URL" >> $REPORT
echo "--------------------------------------------------" >> $REPORT
cat $access_log | awk '{print $11}' | grep http* | sort | uniq -c | sort -nr | head -n 10 >> $REPORT
echo >> $REPORT

echo "Ошибки веб-cервера/приложения" >> $REPORT
echo "--------------------------------------------------" >> $REPORT
cat $access_log | awk '{print $9}' | grep '[3??,4??,5??]' | sort | uniq -c | sort -nr >> $REPORT
echo >> $REPORT

echo "Список всех кодов HTTP ответа" >> $REPORT
echo "--------------------------------------------------" >> $REPORT
cat $access_log | awk '{print $9}' | grep '[1-5]' | sort | uniq -c | sort -n -r >> $REPORT

# Отправка собранной аналитики на e-mail
#echo 'Аналитика с сервера nginx' | mail -s 'Server Admin nginx report' -A $REPORT $EMAIL

# Удаляем файл-метку запущенного процесса
rm $lock_file
# Удаляем репорт-файл при необходимости.
# rm -f $REPORT