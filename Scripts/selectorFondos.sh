#!/bin/bash

# Directorio donde tienes tus fondos de pantalla
DIRECTORIO_IMAGENES="/home/juani/Imágenes/Fondos/"

# Comprobar si rofi está instalado
if ! command -v rofi &> /dev/null; then
    echo "Rofi no está instalado. Instálalo con 'sudo apt install rofi'."
    exit 1
fi

# Comprobar si pywal está instalado
if ! command -v wal &> /dev/null; then
    echo "Pywal no está instalado. Instálalo con 'sudo apt install pywal'."
    exit 1
fi

# Opciones para Rofi: Elegir entre fondo aleatorio o fondo específico
CHOICE=$(echo -e "Fondo aleatorio\nElegir fondo" | rofi -dmenu -i -p "󰸉 ")

# Función para cambiar el fondo de pantalla
set_wallpaper() {
    local wallpaper="$1"
    
    feh --bg-fill "$wallpaper"
    #sleep 1
    wal -q -i "$wallpaper"
    #sleep 1
    #eww reload
    bspc wm -r
}

# Si elige "Fondo aleatorio"
if [ "$CHOICE" == "Fondo aleatorio" ]; then
    # Obtener un fondo aleatorio del directorio de wallpapers
    FONDO_RANDOM=$(find "$DIRECTORIO_IMAGENES" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) -print | shuf -n 1)
    set_wallpaper "$FONDO_RANDOM"
    # Guardar la ruta de la imagen seleccionada en un archivo temporal
    echo "$FONDO_RANDOM" > ~/.fondo_actual.txt 
    sleep 1
    notify-send "Fondo y Tema" "Actualizados aleatoriamente con:\n$FONDO_RANDOM"

# Si elige "Elegir fondo"
elif [ "$CHOICE" == "Elegir fondo" ]; then
    NOMBRE_FONDOS=$(find "$DIRECTORIO_IMAGENES" -type f -name "*.png" -exec basename {} \;)
    # Elegir un fondo de pantalla usando rofi
    FONDO=$(echo "$NOMBRE_FONDOS" | rofi -dmenu -i -p "󰸉 ")
    
    if [ -n "$FONDO" ]; then
        FONDO_ELEGIDO=$(find "$DIRECTORIO_IMAGENES" -type f -name "$FONDO")
        set_wallpaper "$FONDO_ELEGIDO"
        # Guardar la ruta de la imagen seleccionada en un archivo temporal
        echo "$FONDO_ELEGIDO" > ~/.fondo_actual.txt 
        sleep 1
        notify-send "Fondo y Tema" "Actualizados con:\n$FONDO"
    else
        echo "No seleccionaste ningún fondo."
    fi
else
    echo "Opción no válida."
fi

