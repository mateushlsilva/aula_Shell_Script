#!/bin/bash

##########################################################################
#
#			Exercício 7
# Crie um script que mostre todos os usuários “humanos” da máquina seguidos
# de seu UID, Diretório Home e Nome/Descrição.
#
# Autor: Mateus Silva (mateushls01@gmail.com)
#
# Data Criação: 9/12/2022
#
##########################################################################


clear
UID_MIN=$(cat /etc/login.defs | grep UID_MIN | cut -d " " -f2)
UID_MAX=$(cat /etc/login.defs | grep UID_MAX | cut -d " " -f2 | cut -d "X" -f2)

OLDIFS=$IFS
IFS=$'\n'
echo -e "USUARIO\t\tUID\tDIR HOME\tNOME OU DESCRIÇÃO"

for i in $(cat /etc/passwd)
do
	UID_USER=$(echo $i | cut -d ":" -f3)
	if [ $UID_USER -ge $UID_MIN -a $UID_USER -le $UID_MAX ]
	then
		echo -e "$(echo $i | cut -d ":" -f1)\t\t$(echo $UID_USER)\t$(echo $i | cut -d ":" -f6)\t$(echo $i | cut -d ":" -f5 | cut -d "," -f1)"
	fi
done
IFS=$OLDIFS

