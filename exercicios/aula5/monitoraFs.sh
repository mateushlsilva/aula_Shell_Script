#!/bin/bash

##########################################################################
#
#                       Exercício 13
# Criar um script que sendo executado pela crontab do sistema, verifica a
# porcentagem de utilização de todas as partições (/dev/*) e envia um e-mail de
# alerta para cada partição que estiver acima de um limite estabelecido dentro
# do script.
# O programa também deve gerar um log quando o uso estiver acima do normal.
#
# Autor: Mateus Silva (mateushls01@gmail.com)
#
# Data Criação: 14/12/2022
#
##########################################################################

EMAIL=mateus
LIMITE=15
ARQTEMP=/tmp/monitora-part.tmp
LOG=/var/log/scripts/$(basename $0).log

for loop in $(df -h | grep sda|tr -s " "| tr -s ' ' ':')
do
	USU=$(echo $loop|cut -d":" -f5|tr -d "%")
	if [ $USU -ge $LIMITE ]
	then
		PARTICAO=$(echo $loop|cut -d":" -f6)

		echo "Atenção! A Partição $PARTICAO esta com uso acima do limite" >> $ARQTEMP
		echo "Limite = $LIMITE%" >> $ARQTEMP
		df -h $PARTICAO  >> $ARQTEMP
		mutt -s "[$0] - Verifique Particao $PARTICAO " $EMAIL < $ARQTEMP

		echo "$(date "+%d/%m/%Y %H:%M") - Particao $PARTICAO - Uso $USO%" >> $LOG
		rm -f $ARQTEMP
	fi
done
