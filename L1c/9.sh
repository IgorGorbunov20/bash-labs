#!/bin/bash

# Сравнить отчеты (листинги вывода) команды du для
# заданной директории на текущий и некоторый предыдущий
# момент времени, когда данный скрипт выполнялся для
# этой директории в последний раз. Текущий и предыдущий
# временные штампы моментов начала выполнения скрипта
# и различия между отчетами должны сохраняться на диске
# и передаваться вьюеру. Скрипт должен в начале
# проверять, выполнялся ли он уже для заданной
# директории, и если нет, то выдавать соответствующее
# сообщение, не пытаясь при этом выполнить сравнение.
# Параметр: имя директории. Если параметр отсутствует, то
# сравнение должно выполняться для домашней директории.

# Запуск: ./9.sh или ./9.sh ../../../../../ИТМО/

outputDir="9output/"

if [ $1 ]
then
	directory=`readlink -f $1`
else
	directory=`pwd`
fi

size=`du --summarize "$directory"`
size="${size%	*}"

directoryHash=`echo -n $directory | shasum`
directoryHash="${directoryHash%  -*}"

filePath=$outputDir$directoryHash

if [ -f "$filePath" ]
then
	sizeBefore=`cat $filePath`
	echo "Size before: $sizeBefore"
else
	echo "Not found size before"
fi

echo "Size now: $size"

echo "$size" > $filePath