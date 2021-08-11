#!/bin/bash
version="21.08
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Written by Levine <levinegurgelf@gmail.com>"

partition1="$HOME/Desktop/Trabalho/EcoHack/mvplot/partition1/";
partition2="$HOME/Desktop/Trabalho/EcoHack/mvplot/partition2/";
partition3="$HOME/Desktop/Trabalho/EcoHack/mvplot/partition3/";
log="$HOME/Desktop/Trabalho/EcoHack/mvplot/mvplot.log";
fileType="plot"

file="$(basename $partition1/*.$fileType)"
filePartition1=$partition1$file


if [ -f $filePartition1 ]; then

 mv $filePartition1 $partition2 && mv  $partition2$file $partition3
 echo "$(date +%Y%m%d%H%M%S) movendo o arquivo $filePartition1 para a partição $partition2 e movendo da $partition2 para a $partition3" >> $log

fi