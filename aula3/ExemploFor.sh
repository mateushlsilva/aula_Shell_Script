#!/bin/bash
clear 
read -p "Informe o início da sequêcia: " INICIO
read -p "Informe o final da sequêcia: " FINAL

for i in $(seq $INICIO $FINAL)
do
	echo "O valor atual é $i "
	echo "----------------------------"
	sleep 1
done
