#!/bin/bash

######################################################
#
# primeiroScript.sh - Script de Exemplo do Curso
#
# Autor: Mateus Silva (mateushls01@gmail.com)
# Data Criação: 27/03/2022
#
# Descrição: Script de exemplo que le a data e hora
#
# Exemplo de uso: ./primeiroScript.sh
#
# Alterações
#	Dia 31/03/2022 - Inclusão dos comentarios
#
######################################################

DATAHORA=$(date +%H:%M)
ARQALUNOS="/home/mateus/Documentos/estudos/linux/shell_script/aula0/alunos.txt"


# Função de leitura da data e hora
clear
echo "================= Meu Primeiro Script ====================="
echo ""
echo  "Exibir data e hora atual:  $DATAHORA"
 
echo "==========================================================="
echo "Listagem dos Alunos: " 
sort $ARQALUNOS




