#!/bin/bash
version="21.08
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Written by Levine <levinegurgelf@gmail.com>"

partition1="$HOME/mvplot/partition1/";
partition2="$HOME/mvplot/partition2/";
partition3="$HOME/mvplot/partition3/";
log="$HOME/mvplot/mvplot.log";
fileType="plot"

file1="$(basename $partition1*.$fileType)"
filePartition1=$partition1$file1


if [ -f $filePartition1 ]; then
 md5FilePartition1=$(md5sum $filePartition1 | cut -d " " -f1) 
 cp $filePartition1 $partition2
 echo "$(date +%Y%m%d%H%M%S) copiando o arquivo $filePartition1 (hash: $md5FilePartition1) para a partição $partition2" >> $log

 filePartition2=$partition2$file1
 md5FilePartition2=$(md5sum $filePartition2 | cut -d " " -f1)

 while [ $md5FilePartition1 != $md5FilePartition2 ]
  do
    echo "Aguarde, ainda copiando arquivo $file1 da partição $partition1 para a partição $partition2" >> $log
    md5FilePartition2=$(md5sum $filePartition2 | cut -d " " -f1)
  done
  
  echo "$(date +%Y%m%d%H%M%S) Arquivo $file1 (hash: $md5FilePartition1) copiado com sucesso para a partição $partition2!" >> $log

  echo "$(date +%Y%m%d%H%M%S) Removendo o arquivo $filePartition1!" >> $log
  rm $filePartition1

fi

file2="$(basename $partition2*.$fileType)"
filePartition2=$partition2$file2

if [ -f $filePartition2 ]; then
 md5FilePartition2=$(md5sum $filePartition2 | cut -d " " -f1) 
 cp $filePartition2 $partition3
 echo "$(date +%Y%m%d%H%M%S) copiando o arquivo $filePartition2 (hash: $md5FilePartition2) para a partição $partition3" >> $log

 filePartition3=$partition3$file2
 md5FilePartition3=$(md5sum $filePartition3 | cut -d " " -f1)

 while [ $md5FilePartition2 != $md5FilePartition3 ]
  do
    echo "Aguarde, ainda copiando arquivo da partição $partition2 para a partição $partition3" >> $log
    md5FilePartition3=$(md5sum $filePartition3 | cut -d " " -f1)
  done
  
  echo "$(date +%Y%m%d%H%M%S) Arquivo $file2 (hash: $md5FilePartition2) copiado com sucesso para a partição $partition3!" >> $log

  echo "$(date +%Y%m%d%H%M%S) Removendo o arquivo $filePartition2!" >> $log
  rm $filePartition2
fi
