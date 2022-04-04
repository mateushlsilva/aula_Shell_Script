#!/bin/bash

#################################################################################
#                                                                               
#                       Exercício 4                                           	
# Crie um script que baseado no horário atual escreva “Bom Dia”, “Boa Tarde” ou
# “Boa Noite”. Considere que o começo do dia às 06:00.
# O mesmo script deve mostrar também a hora atual no formato de 0 a 12,
# indicando AM ou PM. 	
#	                                                                              
# Autor: Mateus Silva (mateushls01@gmail.com)                                  
#                                                                               
# Data Criação: 3/04/2022                                                       
#                                                                               
#################################################################################

HORA=$(date +%H)

if [ "$HORA" -ge 06 -a "$HORA" -le 12 ]
then
	HORA=$(date +%I:%M)
	echo "Bom Dia!"
	echo "A hora atual é: $HORA AM"
elif [ "$HORA" -le 18  ]
then
	HORA=$(date +%I:%M)
	echo "Boa Tarde!"
	echo "A hora atual é: $HORA AM"
else
	HORA=$(date +%I:%M)
	echo "Boa noite!"
	echo "A hora atual é: $HORA PM"
fi



