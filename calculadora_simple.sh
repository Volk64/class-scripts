#!/bin/bash

echo -n "Escull el primer nombre: ";
read X;
echo -n "Escull el segon nombre: ";
read Y;

echo "Exemple suma: $(( $X + $Y))";
echo "Exemple resta: $(( $X - $Y ))";
echo "Exemple multiplicacio: $(( $X * $Y ))";
echo "Exemple divisio: $(($X / $Y ))";
