#!/bin/bash

for i in ../aula0/*
do
	if [ -f $i ]
	then
		echo "Verificando o arquivo $i"
		LINHAS=$(cat $i | wc -l)
		echo "O arquivo $i contém $LINHAS linhas."
		echo "-----------------------------------------"
		sleep 1
	fi
done
