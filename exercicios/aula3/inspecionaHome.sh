#!/bin/bash

##########################################################################
#
#                       Exercício 9
# Fazer um script que inspecione os diretórios /home/ de todos os usuários em
# busca de arquivos com as extensões .mp3, .mp4 e .jpg.
# O script deve gerar como saída final um relatório com a quantidade de cada
# tipo de arquivo para cada usuário.
#
# Autor: Mateus Silva (mateushls01@gmail.com)
#
# Data Criação: 12/12/2022
#
##########################################################################


# find /home/mateus/ -name '*.mp3' | grep -c 'mp3'


clear
UID_MIN=$(cat /etc/login.defs | grep UID_MIN | cut -d " " -f2)
UID_MAX=$(cat /etc/login.defs | grep UID_MAX | cut -d " " -f2 | cut -d "X" -f2)

OLDIFS=$IFS
IFS=$'\n'

for i in $(cat /etc/passwd)
do
	UID_USER=$(echo $i | cut -d ":" -f3)
	if [ $UID_USER -ge $UID_MIN -a $UID_USER -le $UID_MAX ]
	then
        DIR_HOME=$(echo $i | cut -d ":" -f6)
        JPG=$(find $DIR_HOME/ -name '*.jpg' | grep -c 'jpg')
        MP3=$(find $DIR_HOME/ -name '*.mp3' | grep -c 'mp3') 
        MP4=$(find $DIR_HOME/ -name '*.mp4' | grep -c 'mp4') 
		echo -e "Usuario: $(echo $i | cut -d ":" -f1)\nArquivos JPG: $JPG\nArquivos MP3: $MP3\nArquivos MP4: $MP4\n"
	fi
done
IFS=$OLDIFS