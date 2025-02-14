#!/bin/bash

# Вывести информацию о процессах, запущенных
# заданными командами. Для демонстрации работы скрипта
# подобрать или организовать (при помощь собственных
# программ или команд UNIX) по крайней мере три таких
# процесса (для каждой команды), «спящих» или идущих
# длительное время. Параметры: тексты команды, для
# которых ищутся процессы (скрипт должен уметь
# обрабатывать запрос для нескольких команд сразу).
# Скрипт должен быть написан так, чтобы можно было
# задавать тексты команд, включающие пробелы.

# Запуск: ./13.sh '/usr/sbin/apache2 -k start' '/opt/google/chrome/chrome'

concat=$1
shift
for arg in "$@"
do
	concat=$concat"\|"$arg
done
echo $concat
ps aux | grep "$concat"