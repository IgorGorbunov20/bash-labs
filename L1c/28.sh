#!/bin/bash

# Выполнить рекурсивный поиск в заданной директории
# таких файлов, которые связаны с тем же индексным
# дескриптором (inode), что и заданный файл (то есть
# связаны с последним через жесткие ссылки). Одному
# найденному файлу должна соответствовать одна строка в
# списке. Имена файлов должны быть полными (начинаться
# с /). То, что найдены именно нужные файлы, должно быть
# очевидно из содержания листинга. Параметры: имя файла
# и имя директории. Последний параметр — необязательный;
# по умолчанию поиск выполныется в текущей директории.

if [ "$#" -lt 1 ]; then 
	echo "Usage: $0 file [dir]" >&2
	exit 2
fi

FILE=$1
DIR=${2:-`pwd`}

find "$DIR" -samefile "$FILE" -printf "%i %p\n"