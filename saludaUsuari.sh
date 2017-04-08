#!/bin/bash

function saludaUsuari() {

USERNAEM="$1";
EXUSUARI=false;
fitxer=/etc/passwd

# Comprovem que les dues string siguin iguals i les tractem.
LINIA=$(cat $fitxer | grep $USERNAEM);
if [[ ! -z "$LINIA" ]]; then
	echo "Hola $USERNAEM !"
	EXUSUARI=true;
fi;

if ( ! $EXUSUARI ); then
	echo "L'usuari $USERNAEM no existeix";
fi;

}

saludaUsuari $1


