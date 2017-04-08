#!/bin/bash

LOGS="/home/volk/scriptuelos/log_carrega_massiva.log"

if [[ ! -z "$(find $LOGS -mtime +15)" ]]; then
	echo "" > $LOGS;
	echo "S'han esborrat entrades."
else
	echo "No s'han trobat entrades antigues."
fi;

