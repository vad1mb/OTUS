#!/bin/bash

DIR_DATA=./
#lock_file=$DIR_DATA'/filebash.lock'
date1=$(date +%Y%m%d-%H%M%S)
#echo "DEBUG: date1=$date1"
access_log=$DIR_DATA/apache_logs.2
REPORT=$DIR_DATA'/log-'$date1'.txt'

if [ -f "$lock_file" ]; then
  echo "Процесс уже запущен"
  exit 1
fi
#read BASH1 < $DIR_DATA/temp.txt
#echo "DEBUG: BASH1=$BASH1"

#touch $lock_file

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

#BASH1=$(sed -n '$=' $access_log)
#BASH1=$((BASH1 + 1))
#echo "$BASH1" > $DIR_DATA/temp.txt
#date_t=$(cat $DIR_DATA/date_temp)

#echo 'Log-файл с сервера nginx за период ' $date_t | mail -s 'Server Admin nginx' -A $REPORT email@example.ru

#rm $lock_file
#rm $DIR_DATA/date_temp

