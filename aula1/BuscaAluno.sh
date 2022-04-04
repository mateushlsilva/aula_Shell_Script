#!/bin/bash

###################################################################
#								  #
# BuscarAlunos.sh - Procurar nome completo do aluno		  #
#								  #
# Autor: Mateus Silva (mateushls01@gmail.com)			  #
# Data Criação: 1/04/2022					  #
#                                                                 #
# Descrição: Script de exemplo para o comando read.               #
#	     A partir de uma entrada do usuário, será feita uma   #
#	     busca no arquivo alunos.txt                          #
#                                                                 #
# Exemplo de uso: ./BuscaAlunos.sh                                #
#                                                                 #
###################################################################


ARQALUNOS="/home/mateus/Documentos/estudos/linux/shell_script/aula_Shell_Scprit/aula0/alunos.txt"

clear
echo "==================== Script de Busca de Alunos =========================="
echo ""
read -p "Por favor, informe o nome do aluno:  " NOME

ALUNOCOMPLETO=$(grep $NOME $ARQALUNOS)

echo ""
echo "O nome completo do aluno é: $ALUNOCOMPLETO"
echo ""
echo "==================== FIM ================================================"




