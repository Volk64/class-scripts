#!/bin/bash

function comprovaUsuari() {
USERNAEM=$1;
EXUSUARI=false;
fitxer=/etc/passwd

# Comprovem que les dues string siguin iguals i les tractem.
LINIA=$(cat $fitxer | grep $USERNAEM);
if [[ ! -z "$LINIA" ]]; then
	echo "Nom: "
	echo "$LINIA" | cut -d":" -f5;
	echo "";
	echo "UID: ";
	echo "$LINIA" | cut -d":" -f3;
	echo "";
	echo "DIRECTORI: ";
	echo "$LINIA" | cut -d":" -f6;
	EXUSUARI=true;
	return 0;
fi;

if ( ! $EXUSUARI ); then
	echo "Usuari $USERNAEM inexistent";
	return 1;
fi;

}

comprovaUsuari $1
