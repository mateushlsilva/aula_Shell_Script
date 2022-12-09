#!/bin/bash

#################################################################################
#                                                                               
#                       Exercício 6                                           	
# Crie um script que receba do usuário 2 valores e em seguida exiba um menu
# para ele escolha uma das 4 principais operações aritmétricas (soma,
# subtração, multiplicação e divisão). Após isso a operação e o resultado são
# exibidos ao usuário.
# Considere que:
# • O script deve validar e abortar a execução caso algum dos valores não
# seja informado
# • No caso de multiplicação, o script deve exibir uma mensagem de erro
# caso um dos valores seja 0, e então abortar
# • No caso de divisão, o script deve exibir uma mensagem de erro caso um
# dos valores seja 0, e então abortar
# • Também no caso de divisão, o script deve exibir se é uma divisão exata
# ou com resto.					
#                                                                               
# Autor: Mateus Silva (mateushls01@gmail.com)                                   
#                                                                               
# Data Criação: 4/04/2022                                                       
#                                                                               
#################################################################################


read -p "Valor 1: " N1
read -p "Valor 2: " N2

if [ ! $N1 ] || [ ! $N2 ]
then 
	echo "Nenhum dos valores pode ser nulo!"
	exit 1
fi

echo "1 - Soma"
echo "2 - Subtração"
echo "3 - Multiplicação"
echo "4 - Divisão"
echo "Q - Sair"
read -p "Opção: " opcao
case $opcao in
	1)	
		echo -n "$N1 + $N2 = ";expr $N1 + $N2
		;;
	2)
		echo -n "$N1 - $N2 = ";expr $N1 - $N2
		;;
	3)
		if [ $N1 -eq 0 -o  $N2 -eq 0 ]
		then
			echo "ERRO! Um dos valores é 0 !"
			exit 2
		fi
		echo -n "$N1 "*" $N2 = ";expr $N1 \* $N2
		;;
	4)
		if [ $N1 -eq 0 -o  $N2 -eq 0 ]
		then
			echo "ERRO! Um dos valores é 0 !"
			exit 2
		fi

		if [ $(expr $N1 % $N2) -ne 0 ]
		then
			echo -n "Divisão com Resto = ";expr $N1 % $N2
		else
			echo "Divisão Exata"
		fi
		echo -n "$N1 "/" $N2 = ";expr $N1 / $N2
		;;
	[Qq])
		echo "Saindo..."
		exit 0
		;;
	*)
		echo "Opção Inválida"
		exit 1
		;;
	esac

