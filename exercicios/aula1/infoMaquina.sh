#!/bin/bash

#################################################################################
#                                                                               #
#                       Exercício 2						#
# Crie um script que gere um relatório de algumas informações da máquina atual:	#
# • Nome da Máquina								#
# • Data e Hora Atual								#
# • Desde quando a máquina está ativa						#
# • Versão do Kernel								#
# • Quantidade de CPUs/Cores							#
# • Modelo da CPU								#
# • Total de Memória RAM Disponível						#
# • Partições                                            		        #
#   									        #
#                								#
#                                                                               #
# Autor: Mateus Silva (mateushls01@gmail.com)                                   #
#                                                                               #
# Data Criação: 1/04/2022                                                       #
#                                                                               #
#################################################################################


NOME=`uname -s`
DATAHORAATUAL=$(date)
MAQUINAATIVA=$(uptime -s)
KERNEL=$(uname -r)
CPU=$(cat /proc/cpuinfo |grep "model name"|wc -l)
MODELOCPU=$(lscpu -J|grep modelo |cut -d ":" -f4 |sed 's/"},/ /' |sed 's/"/ /')
RAM=$(free -m |grep Mem |sed 's/Mem.:          //g '| cut -d" " -f1)
PARTICAO=$(df -h |egrep -v '(tmpfs|udev|loop)')

clear
echo "=========================================================="
echo "Relatório da Máquina:  $NOME"
echo "Data/Hora: $DATAHORAATUAL"
echo "=========================================================="
echo ""
echo "Máquina Ativa desde: $MAQUINAATIVA"
echo ""
echo "Versão do Kernel: $KERNEL"
echo ""
echo "CPUs: "
echo "Quantidade de CPUs/CORE: $CPU"
echo "Modelo da CPU: $MODELOCPU "
echo ""
echo "Memória Total: $RAM MB"
echo ""
echo -e "Patições:\n$PARTICAO"




