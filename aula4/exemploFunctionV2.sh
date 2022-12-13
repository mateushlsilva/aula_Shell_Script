#!/bin/bash

ler (){
	read -p "Informe o Nome: " NOME
	read -p "Informe o Sobrenome: " SOBRENOME
}

ler
echo $NOME $SOBRENOME
