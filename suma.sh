#!/bin/bash

function suma() {
	TOTAL="$(( $1 + $2 ))";
	echo "$TOTAL";
}

function suma2() {
	TOTAL="$(( $1 + $2 ))"	
	return $TOTAL
}

echo "El resultat de $1 + $2 és $(suma $1 $2)";

echo "El resultat de $1 + $2 és $(suma $1 $2)"
