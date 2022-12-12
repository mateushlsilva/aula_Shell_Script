#!/bin/bash

##########################################################################
#
#                       Exercício 10
# Fazer um script que crie um arquivo e o preencha com um conjunto de
# caracteres até que um determinado tamanho em bytes seja atingido.
# O usuário deverá fornecer o nome do arquivo, o conjunto de caracteres que
# será utilizado para preenchimento do arquivo, e o tamanho final do arquivo em
# bytes.
# Crie também uma lógica que mostre o andamento da criação desse arquivo, de
# 10 em 10%, e o tamanho atual do arquivo.
# Se o arquivo já existir, toda a informação anterior será apagada.
#
# Autor: Mateus Silva (mateushls01@gmail.com)
#
# Data Criação: 12/12/2022
#
##########################################################################


read -p "Informe o nome do arquivo a ser criado: " ARQ
read -p "Informe um conjunto de caracteres que será usado para preencher o arquivo: " CARACTERE
read -p "Informe o tamanho final do arquivo (em bytes): " TAMANHO

rm -rf $ARQ ; touch $ARQ

PORCENT=0

until [ $TAMANHO -le $(stat --printf=%s "$ARQ") ]
do
    echo -n $CARACTERE >> $ARQ 
    TAM_ATUAL=$(stat --printf=%s "$ARQ")
    PORCENT_ATUAL=$(expr $TAM_ATUAL \* 100 / $TAMANHO)

    if [ $(expr $PORCENT_ATUAL % 10) -eq 0 -a $PORCENT -ne $PORCENT_ATUAL ]
    then
        echo "Concluído: $PORCENT_ATUAL% - Tamanho do Arquivo: $TAM_ATUAL"
        PORCENT=$PORCENT_ATUAL
    fi
done