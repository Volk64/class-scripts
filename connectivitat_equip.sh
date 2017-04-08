#!/bin/bash
echo "Quina interficie de xarxa vols comprovar? ";
read IF
INET=$(ip addr show $IF | grep "inet " | cut -d" " -f6 );
GATEWAY=$(ip route | grep "default" | cut -d" " -f3 );
DNS=$(cat /etc/resolv.conf | grep "nameserver" | cut -d" " -f2 );

echo "La IP de la màquina és $INET";
echo "La porta d'enllaç és $GATEWAY";

ping -c1 $GATEWAY &> /dev/null

if [ $? -eq 0 ]; then
        echo "La màquina té accés a la porta d'enllaç";
else
	echo "La màquina no té accés a la porta d'enllaç";
fi;

if [[ ! -z "$DNS" ]]; then
	echo "El sistema té definit el DNS $DNS";
else
	echo "No hi ha cap DNS definit";
fi;

ping -c1 8.8.8.8 &> /dev/null

if [ $? -eq 0 ]; then
	echo "La màquina té accés a internet";
else
	echo "La màquina no té accés a internet";
fi;
