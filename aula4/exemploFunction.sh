#!/bin/bash

maiuscula(){
	local VAR1=$(echo $1 | tr a-z A-Z)
}

VAR1=$(maiuscula shell)
echo $VAR1
