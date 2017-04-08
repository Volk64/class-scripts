#!/bin/bash

FITXER=$(zenity --file-selection --title="Selecciona un fitxer d'usuaris")

for LINIA in $(cat $FITXER); do
	EDAT="$(echo "$LINIA" | cut -d"," -f4)"
	if [[ "$EDAT" -gt "18" || "$EDAT" -eq "18" ]]; then
		
		# Desem les dades de l'usuari
		NOM="$(echo "$LINIA" | cut -d"," -f1)"
		PASS="$(echo "$LINIA" | cut -d"," -f3)"
		GRUP="$(echo "$LINIA" | cut -d"," -f2)"
		
		# Comprovem que el grup existeixi, si no, el creem.
		if [[ -z $(getent group "$GRUP") ]]; then
			groupadd $GRUP
		fi;

		# Creem l'usuari i l'obliguem a canviar la contrasenya
		# al següent login
		useradd -g $GRUP -p $PASS $NOM
		chage -d 0 $NOM
		if [[ $? == 0 ]]; then
			echo "$(date) -| Usuari inserit correctament." >> log_carrega_massiva.log
		else
			echo "$(date) -| Error en l'inserció." >> log_carrega_massiva.log
		fi;
	fi;
done;
