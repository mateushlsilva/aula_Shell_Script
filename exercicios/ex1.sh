#!/bin/bash

#################################################################################
# 										#
# 			Exercício 1						#
# Crie um Script que após executado solicite dois valores como entrada. Esses	#
# valores devem ser somados e o resultado exibido para o usuário.		#
#										#
# Autor: Mateus Silva (mateushls01@gmail.com)					#
#										#
# Data Criação: 1/04/2022							#
#										#
#################################################################################


read -p "Primeiro Número: " N1
read -p "Segundo Número: " N2
S=$(expr $N1 + $N2)
echo "A soma dos números $N1 + $N2 é:  $S"












