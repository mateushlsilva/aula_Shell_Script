#!/bin/bash

#################################################################################
#                                                                               
#                       Exercício 5                                           	
# Crie um script que gere um arquivo compactado de backup de todo o diretório
# home do usuário atual (/home/<usuario>).
# Considere que:
# • O arquivo de backup será criado no diretório /home/<usuario>/Backup
# • O nome do arquivo de backup deve seguir o padrão backup_home_AAAAMMDDHHMM.tgz, exemplo
# 		backup_home_201708241533.tgz
# • Caso o diretório /home/<usuario>/Backup não exista, o script deve criá-lo
# • Antes de criar o backup, o script deve consultar se existe algum arquivo
# de backup criado na última semana. Se exisitir, o usuário deve ser
# consultado se deseja continuar. Se o usuário optar por não continuar, o
# script deve abortar com código de saída 1.
# • Após gerar o backup, o script deve informar o nome do arquivo gerado.					
#                                                                               
# Autor: Mateus Silva (mateushls01@gmail.com)                                   
#                                                                               
# Data Criação: 3/04/2022                                                       
#                                                                               
#################################################################################

USU=$HOME/Backup
DATA=$(date +%Y%m%d%H%M)
ARQ=backup_home_"$DATA".tgz



if [ ! -d $USU ]
then
	echo "Criando Diretório $USU"
	mkdir -p $USU
fi

DAYS7=$(find $USU -ctime -7 -name backup_home\*tgz)

if [ "$DAYS7" ]
then
	echo "Já foi gerado um backup do diretório $HOME nos últimos 7 dias."
	echo -n "Deseja continuar? (N/s): "
	read -n1 CONT
	echo
	if [ "$CONT" = N -o "$CONT" = n -o "$CONT" = "" ]	
	then
		echo "Backup Abortado!"
		exit 1
	elif [ $CONT = S -o $CONT = s ]
	then
		echo "Será criado mais um backup para a mesma semana"
	else
		echo "Opção Inválida"
		exit 2
	fi
fi

echo "Criando Backup ..."
tar zcvpf $USU/$ARQ --absolute-names --exclude="$HOME/Downloads" --exclude="$HOME/Lixeira" --exclude="$USU" "$HOME"/* > /dev/null

echo
echo "O backup de nome \""$ARQ"\" foi criado em $USU"
echo
echo "Backup Concluído!"






