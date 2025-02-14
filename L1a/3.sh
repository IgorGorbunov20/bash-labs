#!/bin/bash

# Изменить расширения группы файлов. (Под
# «расширением» понимается часть имени файла после
# последней точки). Параметры: новое расширение extn и
# имена файлов, число которых заранее не известно.
# Примечание: в случае, если исходное имя файла не
# содержит точки или заканчивается ею, к нему должно
# быть добавлено .extn или extn, соответственно.

#Запуск: ./3.sh newextn test_extn/t.txt test_extn/t2.fo.hi test_extn/t3 test_extn/t4.

extn=$1
shift

for arg in "$@"
do
	filename=$(basename $arg)
	newfilename="${filename%.*}.$extn"
	mv $arg $(dirname $arg)/$newfilename
done