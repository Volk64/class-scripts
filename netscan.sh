#!/bin/bash

# Petit script que escanneija la xarxa en cerca de dispositius connectats

CNT=0

for ip in $(seq 1 254); do ping -c 1 192.168.0.$ip>/dev/null; 
    [ $? -eq 0 ] && echo "192.168.0.$ip UP" || : ;
    CNT=$((CNT+1));
done

echo "S'han trobat $CNT màquines a la xarxa 192.168.0.0 amb data $(date) \n"
