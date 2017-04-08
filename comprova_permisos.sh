#!/bin/bash

echo "Quin fitxer vols comprovar? (utilitza la seva ruta absoluta) ";
read FITXER;

PERMISOS=$(ls -l $FITXER | cut -d" " -f1);
GRUP=$(ls -l $FITXER | cut -d" " -f4)
PERMISOSGRUP=${PERMISOS:4:3}

# Extreiem els tres caràcters i comprovem si tenen permisos
# Si no en tenen l'expressió retorna un error, el qual reenviem
# a /dev/null.
if [[ "${PERMISOSGRUP:0:1}" -eq "r" ]] 2>/dev/null; then
	echo "El grup té permis de lectura";
else
	echo "El grup no té permís de lectura";
fi;

if [[ "${PERMISOSGRUP:1:1}" -eq "w" ]] 2>/dev/null; then
        echo "El grup té permis d'escriptura";
else
        echo "El grup no té permís d'escriptura";
fi;

if [[ "${PERMISOSGRUP:2:1}" -eq "x" ]] 2>/dev/null; then
        echo "El grup té permis d'execució";
else
        echo "El grup no té permís d'execució";
fi;
exit 1;
