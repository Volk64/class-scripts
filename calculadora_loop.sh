#!/bin/bash

continuar=true;

echo -n "Escull el primer nombre: ";
read X;
echo -n "Escull el segon nombre: ";
read Y;



select opcio in "Suma" "Resta" "Multiplicacio" "Divisio" "Sortir"; do

	case $opcio in
		"Suma" )	echo "El resultat és $(( $X + $Y ))";;
		"Resta" )	echo "El resultat és $(( $X - $Y ))";;
		"Multiplicacio" )     echo "El resultat és $(( $X * $Y ))";;
		"Divisio" )     echo "El resultat és $(( $X / $Y ))";;
		"Sortir" )     echo "Sortint..." && exit 1;;
	esac;
	echo "1) Suma		  3) Multiplicacio  5) Sortir";
	echo "2) Resta	  4) Divisio";

done;


