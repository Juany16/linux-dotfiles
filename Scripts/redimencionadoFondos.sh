#!/bin/bash

# Carpeta de origen y destino
ORIGEN="$HOME/Imágenes/Fondos/"
DESTINO="$HOME/Imágenes/Fondos-1366-768"

# Crear carpeta destino si no existe
mkdir -p "$DESTINO"

# Loop por todas las imágenes válidas
find "$ORIGEN" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | while read -r archivo; do
    nombre_base="$(basename "$archivo")"
    extension="${nombre_base##*.}"
    nombre_sin_ext="${nombre_base%.*}"

    nuevo_nombre="${nombre_sin_ext}-1366-768.${extension}"
    salida="$DESTINO/$nuevo_nombre"

    echo "Procesando: $nombre_base → $nuevo_nombre"

    convert "$archivo" -resize 1366x768^ -gravity center -extent 1366x768 "$salida"
done

echo "✅ Conversión finalizada. Fondos redimensionados en: $DESTINO"

