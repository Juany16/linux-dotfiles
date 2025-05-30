#!/bin/bash

# Leer la ruta de la imagen actual desde el archivo temporal
#RUTA=$(cat /tmp/fondo_actual.txt)
RUTA=$(cat $HOME/.fondo_actual.txt)

echo "$RUTA"
# Obtener solo el nombre del fondo de pantalla (sin la ruta)
#NOMBRE=$(basename "$RUTA")

# Imprimir el nombre del fondo de pantalla
#echo "$NOMBRE"

