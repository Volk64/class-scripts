#!/bin/bash

function crea_usuari () {
	useradd -m -p "$2" -s /bin/bash -U -k /etc/default/useradd "$1"
	return 1;
};

CADENAUSUARI="$(zenity --forms --title="Afegir Usuari" \
	--text="Introdueix l'informació de l'usuari" \
	--separator=":" \
	--add-entry="Nom d'usuari" \
	--add-password="Contrasenya")"

NOM=$(echo "$CADENAUSUARI" | cut -d":" -f1)
PASS=$(echo "$CADENAUSUARI" | cut -d":" -f2)
if [[ "$CADENAUSUARI" == ":" || -z "$NOM" || -z "$PASS" ]]; then
	echo "No has introduit totes les dades!";
	exit 2;
fi;

crea_usuari $NOM $PASS
exit 1;
