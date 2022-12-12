#!/bin/bash

##########################################################################
#
#                       Exercício 8
# Crie um script que receba um nome de processo como argumento e que
# constantemente irá verificar se o processo está em execução.
# Caso não esteja, deve ser exibida uma mensagem na sessão do usuário a cada
# x segundos.
# O processo deve rodar como Daemon, ou seja, deve estar sempre em
# execução, verificando o processo em questão a cada x segundos.
#
# 	Exemplo de funcionamento: monitoraProcesso.sh <nomeDoProcesso> &
#
# Autor: Mateus Silva (mateushls01@gmail.com)
#
# Data Criação: 10/12/2022
#
##########################################################################

if [ $# -eq 0 ]
then
        echo "Por favor passar um parâmetro para o script! "
        echo "Exemplo monitoraProcesso.sh <nomeDoProcesso> &"
        exit 1
fi

while true
do
        if ps axu | grep $1 | grep -v grep | grep -v $0 > /dev/null
        then
                sleep 3
        else
                echo "ATENÇÃO!!!!!!! O processo $1 NÃO está em execução!"
                sleep 3
                echo
        fi
done


