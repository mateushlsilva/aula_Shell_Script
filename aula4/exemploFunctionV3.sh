#!/bin/bash

adiciona () {
	local soma=$(expr $1 + $2)
	return $soma
}

adiciona 10 20

echo "O resultado da soma foi $?"

