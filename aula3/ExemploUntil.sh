#!/bin/bash

until ps axu | grep firefox | grep -v grep > /dev/null
do
	echo "Incie o FireFox ..."
	sleep 3
	echo
done

echo "FireFox Iniciado."
echo "PID: $(pgrep firefox)" 
