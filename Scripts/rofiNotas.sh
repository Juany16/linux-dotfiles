#!/bin/bash

DIR_NOTAS="/home/juani/Documentos/Notas Daily List/"

if [ -z "$DIR_NOTAS" ]; then
    echo "No hay notas disponibles."
    exit 1
fi

NOTAS=$(find "$DIR_NOTAS" -type f -name "*.txt" -exec basename {} \;)
NOTA=$(echo "$NOTAS" | rofi -dmenu -p " ")
if [ -n "$NOTA" ]; then
    ABRIR_NOTA=$(find "$DIR_NOTAS" -type f -name "$NOTA")
    #xfce4-terminal --hold -e "nvim '$ABRIR_NOTA'"
    kitty -e nvim "$ABRIR_NOTA"
fi
