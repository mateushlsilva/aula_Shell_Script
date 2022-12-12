#!/bin/bash

##########################################################################
#
#                       Exercício 11
# Crie um script que receba uma opção e uma data, as opções serão as
# seguintes:
# • -f <DATA>: Retorna 0 para data no formato BR (DD/MM/YYYY ou
# DDMMYYY), 1 para formato US (MM/DD/YYYY ou MMDDYYYY), 2 quando
# não é possível determinar (Exemplo 12/12/1990) e 3 quando o dia e mês
# são inválidos (Exemplo 30/30/1990)
# -i <DATA>: Inverte a data de formato BR para US ou de US para BR.
# Sempre inclui barras.
# • -b <DATA>: Inclui as barras de data. Validar se o formato
# • -e <DATA>: Exibe a data em formato extenso. Exemplo de 13081918
# para 13 de Agosto de 1981"
# • --help: Exibir o help do comando
#
# Autor: Mateus Silva (mateushls01@gmail.com)
#
# Data Criação: 12/12/2022
#
##########################################################################


help() {
    echo -e "Uso ./FuncoesDiversas.sh OPÇÃO DATA\n
DATA nos formatos DDMMYYYY ou MMDDYYYY, com ou sem /\n
Opções:\n
-f = Retorna 0 para BR, 1 para US e 2 quando impossível determinar, 3 Inválido\n
-i = Inverte formato BR para US e US para BR. Inclui as Barras\n
-b = Inclui Barras de Data. Exemplo: de 13081981 para 13/08/1981\n
-e = Exibe a data em formato extenso. Exemplo de 13081918 para 13 de
Agosto de 1981\n"
}

f(){
    DATA1=$(echo $1 | cut -c 1-2)
    DATA2=$(echo $1 | cut -c 3-4)
    DATA3=$(echo $1 | cut -c 5-8)
    
    if [ $DATA2 -le 12 -a $DATA1 -le 12 ]
    then
        return 2
    fi
    if [ $DATA1 -le 31 -a $DATA1 -gt 0  -a $DATA2 -le 12 -a $DATA2 -gt 0 ]
    then
        if [ $DATA2 -eq 02 -a $DATA1 -gt 29 ]
        then
            return 3
        else
            return 0
        fi
    else
        if [ $DATA1 -le 12 -a $DATA1 -gt 0  -a $DATA2 -le 31 -a $DATA2 -gt 0 ]
        then
            if [ $DATA2 -eq 02 -a $DATA1 -gt 29 ]
            then
                return 3
            else
                return 1
            fi
        fi
    fi
    return 3
}

i(){
    DATA1=$(echo $1 | cut -c 1-2)
    DATA2=$(echo $1 | cut -c 3-4)
    DATA3=$(echo $1 | cut -c 5-8)
    DATA=$DATA2'/'$DATA1'/'$DATA3
}

b(){
    DATA1=$(echo $1 | cut -c 1-2)
    DATA2=$(echo $1 | cut -c 3-4)
    DATA3=$(echo $1 | cut -c 5-8)
    DATA=$DATA1'/'$DATA2'/'$DATA3
}

mes(){
    MES=""
    if [ $1 -eq 01 ]
    then
        MES="Janeiro"
    elif [ $1 -eq 02 ]
    then
        MES="Fevereiro"
    elif [ $1 -eq 03 ]
    then
        MES="Março"
    elif [ $1 -eq 04 ]
    then
        MES="Abril"
    elif [ $1 -eq 05 ]
    then
        MES="Maio"
    elif [ $1 -eq 06 ]
    then
        MES="Junho"
    elif [ $1 -eq 07 ]
    then
        MES="Julho"
    elif [ $1 -eq 08 ]
    then
        MES="Agosto"
    elif [ $1 -eq 09 ]
    then
        MES="Setembro"
    elif [ $1 -eq 10 ]
    then
        MES="Outubro"
    elif [ $1 -eq 11 ]
    then
        MES="Novembro"
    elif [ $1 -eq 12 ]
    then
        MES="Dezembro"
    fi
}

e(){
    DATA1=$(echo $1 | cut -c 1-2)
    DATA2=$(echo $1 | cut -c 3-4)
    DATA3=$(echo $1 | cut -c 5-8)
    F=$(f $1)
    case $? in 
    0)
        mes $DATA2
        echo -e "$DATA1 de $MES de $DATA3"
        ;;
    1)
        mes $DATA1
        echo -e "$DATA2 de $MES de $DATA3"
        ;;
    2)
        read -p "Impossível determinar o padrão de data.
1 - BR (DD/MM/YYYY)
2 - US (MM/DD/YYYY)
Informe o formato (1 ou 2): " OPCAO
        case $OPCAO in 
        1)
            mes $DATA2
            echo -e "$DATA1 de $MES de $DATA3"
            ;;
        2)
            mes $DATA1
            echo -e "$DATA2 de $MES de $DATA3"
            ;;
        *)
            echo "Opção Inválida!"
            ;;
        esac

        ;;
    3)
        echo "Formato da Data está escrito ERRADO!"
        echo -e "Experimente "./funcoesDiversas.sh --help" para mais informações."
        ;;
    esac
}

flag() {
    case $1 in 
    --help)
        help
        ;;
    -f)
        f $2
        echo $?
        ;;
    -i)
        i $2
        echo $DATA
        ;;
    -b)
        b $2
        echo $DATA
        ;;
    -e)
        e $2
        ;;
    *)
        echo -e "Experimente "./funcoesDiversas.sh --help" para mais informações."
        ;;
    esac
}

flag $1 $2
