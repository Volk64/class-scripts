#!/bin/bash


function decrementa_numero(){

	COMPTADOR="$(($1))";
	echo "$COMPTADOR";

	until [[ "$COMPTADOR" -eq "0" ]]; do
		COMPTADOR="$((COMPTADOR - 1))";
		echo "$COMPTADOR";
	done;
	return 1;
}

function incrementa_numero(){
	
	COMPTADOR="$((0))";
	echo "$COMPTADOR";
	
	while [[ "$COMPTADOR" -lt "$1" ]]; do
		COMPTADOR="$((COMPTADOR + 1))";
		echo "$COMPTADOR";
	done;
	return 1;
}

echo -n "Introdueix un número a decrementar: ";
read DECREMENTA;

decrementa_numero $DECREMENTA;

echo -n "Introdueix un número a incrementar: ";
read INCREMENTA;

incrementa_numero $INCREMENTA;
