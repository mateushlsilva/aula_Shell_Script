#!/bin/bash

ARQALUNOS="../aula0/alunos.txt"

clear
echo "========================= Script de Busca de Alunos ===================="
echo

if [ $# -gt 0 ]
then 
	ALUNOCOMPLETO=$(grep -i "$1" "$ARQALUNOS")
	echo "O nome completo do aluno é: "$ALUNOCOMPLETO""
else
	echo "Informe o nome do aluno como parâmetro!"
fi
echo
echo "========================= Fim do Script ================================"




