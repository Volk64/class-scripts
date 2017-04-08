#!/bin/bash

NUMERO="$(( RANDOM %= 20 ))";
INTENTS="0";
ERNUMEROS='^[0-9]+$';

# Per fer proves, imprimim el numero per pantalla
# echo "$NUMERO";

while [[ $INTENTS -lt "7" ]]; do
	echo "Endevina el nombre generat";
	echo "Intents realitzats: $INTENTS";
	read INTENT;

	# Llegim l'input de l'usuari i comprovem amb regular expressions
	# si aquest és un número. Si no ho és li ho diem al usuari.
	if [[ "$INTENT" =~ $ERNUMEROS ]]; then
		if [[ "$INTENT" -eq "$NUMERO" ]]; then
			echo "Felicitats, ho has endevinat!";
			exit 1;
		else
			# en cas de no acertar
			# incrementem el numero d'intents
			INTENTS=$(( INTENTS + 1 ));
		fi;
	else
		echo "No has ficat un numero. Posa un numero."
	fi;
done;

echo "T'has quedat sense intents";
