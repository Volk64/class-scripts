#!/bin/bash

function creaCron () {

# Capçalera del nou fitxer cron
STRHEADER="SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
"

STRCRON="0 0 $CRONDIA $CRONMES * root tar czf $BACKUP $DIRECTORI_BACKUP"

# Comprovem que el fitxer existeixi, i si no el creem.
if [ ! -f "/etc/cron.d/crearBackup" ]; then
	echo "$STRHEADER" > /etc/cron.d/crearBackup
	echo "$STRCRON" >> /etc/cron.d/crearBackup
 else
	echo "$STRCRON" >> /etc/cron.d/crearBackup
fi;

}

function comprovaBackupDirectori () {
	if [[ -z "$(find /backup)" ]]; then
		echo "$(date) -| El directori backup no existeix. Creant..." >> /var/log/creaCopiaSeguretat.log
		mkdir /backup;
		if [ $? ]; then
			echo "$(date) -| Directori creat correctament." >> /var/log/creaCopiaSeguretat.log
		else
			echo "$(date) -| Error en la creació del directori." >> /var/log/creaCopiaSeguretat.log
		fi;
	fi;
}

comprovaBackupDirectori
$(zenity --question --text="Vols executar el backup ara?");

if [ $? -ne 0 ]; then
	# Dialeg del calendari. Retorna el día de la setmana, de 0-6 on 0 és Diumenge
	DATACRON=$(zenity --calendar \
		--text="Escolleix el día en el que vols que es crei el nou cron." \
		--title="Escollir el dia" \
		--date-format="%y/%m/%d")
	CRONDIA=$(echo "$DATACRON" | cut -d"/" -f3)
	CRONMES=$(echo "$DATACRON" | cut -d"/" -f2)

	DIRECTORI_BACKUP=$(zenity --file-selection --directory)
	BACKUP="/backup/$(date +'%Y-%m-%d')-backup.tar.gz"
	creaCron;
	if [ $? ]; then
		echo "$(date) -| Copia de seguretat creada correctament" >> /var/log/creaCopiaSeguretat.log
	else
		echo "$(date) -| Error en la creació de la copia de seguretat" >> /var/log/creaCopiaSeguretat.log
	fi;
else
	DIRECTORI_BACKUP=$(zenity --file-selection --directory)
	BACKUP="/backup/$(date +'%Y-%m-%d')-backup.tar.gz"

	tar czf $BACKUP $DIRECTORI_BACKUP
	if [ $? ]; then
		echo "$(date) -| Copia de seguretat creada correctament" >> /var/log/creaCopiaSeguretat.log
	else
		echo "$(date) -| Error en la creació de la copia de seguretat" >> /var/log/creaCopiaSeguretat.log
	fi;
fi;
