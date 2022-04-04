#!/bin/bash

USUARIO=$(grep "$1" /etc/passwd)

#if grep "$1" /etc/passwd > /dev/null
if test -n "$USUARIO" #  -n Para não null
then
	echo "O usuário existe!"
else
	echo "O usuário não existe!"
fi
