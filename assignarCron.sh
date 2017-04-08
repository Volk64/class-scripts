#!/bin/bash

# Dialeg del calendari. Retorna el día de la setmana, de 0-6 on 0 és Diumenge
DATACRON=$(zenity --calendar \
	--text="Escolleix el día de la setmana en el que vols que s'executi el nou cron." \
	--title="Escollir el dia de la setmana" \
	--date-format="%w")
# Capçalera del nou fitxer cron
STRHEADER="SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
"

STRCRON="0 0 * * $DATACRON root /home/volk/scriptuelos/cleaner.sh"

# Comprovem que el fitxer existeixi, i si no el creem.
if [ ! -f "/etc/cron.d/netejar" ]; then
	echo "$STRHEADER" > /etc/cron.d/netejar
	echo "$STRCRON" >> /etc/cron.d/netejar
 else
	echo "$STRCRON" >> /etc/cron.d/netejar
fi;

