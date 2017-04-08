#!/bin/bash
echo "Quin usuari cerquem? ";
read USERNAEM;
EXUSUARI=false;
fitxer=/etc/passwd

function crea_usuari {
	echo "Introdueix l'UID del nou usuari: "
	read NOVAUID;
	echo "Introdueix el grup del nou usuari: ";
	read NOUGP;
	echo "Introdueix la shell per defecte del nou usuari: ";
	read NOUSHELL;
	groupadd $NOUGP;
	useradd -u $NOVAUID -g $NOUGP -s $NOUSHELL -c "${USERNAEM}" $USERNAEM
	return 1;
};

# Comprovem que les dues string siguin iguals i les tractem.
LINIA=$(cat $fitxer | grep $USERNAEM);
if [[ ! -z "$LINIA" ]]; then
	echo "Usuari trobat! Printant les seves dades...";
	echo "";
	echo "Nom: "
	echo "$LINIA" | cut -d":" -f5;
	echo "";
	echo "UID: ";
	echo "$LINIA" | cut -d":" -f3;
	echo "";
	echo "GID: ";
	echo "$LINIA" | cut -d":" -f4;
	echo "";
	echo "SHELL: ";
	echo "$LINIA" | cut -d":" -f7;
	EXUSUARI=true;
fi;

if ( ! $EXUSUARI ); then
	echo "Sembla que l'usuari no existeix, vols crear-lo?";
	select sn in "Sí" "No"; do
		case $sn in
			Sí )	crea_usuari; exit 1;;
			No )	echo "Ok" && exit 1;;
		esac;
	done;
fi;


