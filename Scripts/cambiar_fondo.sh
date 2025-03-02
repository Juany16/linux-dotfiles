#!/bin/bash

# Directorio que contiene las imágenes para seleccionar aleatoriamente
DIRECTORIO_IMAGENES="/home/juani/Imágenes/Fondos/"

# Utilizar find para buscar archivos de imagen dentro del directorio y shuf para seleccionar uno aleatoriamente
RUTA_IMAGEN=$(find "$DIRECTORIO_IMAGENES" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) -print | shuf -n 1)

# Guardar la ruta de la imagen seleccionada en un archivo temporal
#echo "$RUTA_IMAGEN" > /tmp/fondo_actual.txt
echo "$RUTA_IMAGEN" > /home/juani/.fondo_actual.txt

# Comprobar si se encontró una imagen válida
if [ -n "$RUTA_IMAGEN" ]; then
    # Comando para cambiar el fondo de pantalla con feh
    feh --bg-fill "$RUTA_IMAGEN"
    fondo=$(~/.config/Scripts/obtener_fondo.sh)
    wal -q -i "$fondo"
    #eww reload
    bspc wm -r
else
    echo "No se encontraron imágenes en el directorio especificado."
fi

