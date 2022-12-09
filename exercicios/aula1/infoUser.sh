#!/bin/bash


#################################################################################
#                                                                               #
#                       Exercício 3                                           	#
# Crie um script que receba um nome de usuário como parâmetro e exiba as 	#
# seguintes informações:							#
# • UID do usuário								#
# • Nome Completo / Descrição do Usuário					#
# • Total em Uso no /home do usuário						#
# • Informações do último login do usuário					#
#                                                                               #
# Autor: Mateus Silva (mateushls01@gmail.com)                                   #
#                                                                               #
# Data Criação: 1/04/2022                                                       #
#                                                                               #
#################################################################################



read -p "Nome do usuário: " USU

UI=$(grep $USU /etc/passwd|cut -d":" -f3)
NOME=$(grep $USU /etc/passwd|cut -d":" -f5| tr -d ,)
HOME=$(du -h -c /home/$USU |tail -n1 |cut -d"t" -f1)

echo "UID: $UI"
echo "Nome ou Descrição: $NOME"
echo ""
echo "Total Usado no /home/$USU: $HOME"
echo ""
echo "Ultimo Login: "
lastlog -u $USU

