#!/bin/bash

read -p "Qual o(a) melhor aluno(a): " MELHOR

for i in $(cat ../aula0/alunos.txt)
do
	if [ $i = $MELHOR ]
	then
		echo "Melhor aluno(a) é $i"
		break
	fi
	echo "Aluno(a): $i"
done
