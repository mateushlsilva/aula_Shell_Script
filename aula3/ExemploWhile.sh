#!/bin/bash

clear
PROCESSO=$(ps axu | wc -l)
read -p "Informe o Limite de Processos: " MAXIMO
while [ $PROCESSO -le $MAXIMO ]
do
	PROCESSO=$(ps axu | wc -l)
	echo "Tudo Ok"
	echo "Processo Atuais: $PROCESSO "
	echo "----------------------------------------------------"
	sleep 3
done

echo "Limite de Processos Excedido"
echo "Por favor verifique o sistema"
