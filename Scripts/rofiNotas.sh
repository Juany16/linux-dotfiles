#!/bin/bash

DIR_NOTAS="$HOME/Documentos/Notas Daily List/"

if [ -z "$DIR_NOTAS" ]; then
    echo "No hay notas disponibles."
    exit 1
fi

# Opción para crear una nueva nota
OPCIONES="  Crear nueva nota\n  Borrar nota\n$(
    find "$DIR_NOTAS" -type f -name "*.txt" -exec basename {} \;
)"

# Seleccionar opción en rofi
SELECCION=$(echo -e "$OPCIONES" | rofi -dmenu -i -p "󱞁 ")

# Si la opción es "Crear nueva nota"
if [[ "$SELECCION" == "  Crear nueva nota" ]]; then
    NOMBRE_NOTA=$(rofi -dmenu -i -p "Nombre de la nueva nota: ")
    if [ -n "$NOMBRE_NOTA" ]; then
        RUTA_NOTA="$DIR_NOTAS/$NOMBRE_NOTA.txt"
        touch "$RUTA_NOTA"
        notify-send "Notas" "Nota creada: \n<b>$NOMBRE_NOTA</b>"
        #xfce4-terminal --hold -e "nvim '$RUTA_NOTA'"
        kitty -e nvim "$ABRIR_NOTA"
    fi
# Si se selecciona "Borrar nota"
elif [[ "$SELECCION" == "  Borrar nota" ]]; then
    NOTA_A_BORRAR=$(find "$DIR_NOTAS" -type f -name "*.txt" -exec basename {} \; | rofi -dmenu -i -p "Seleccioná la nota a borrar: ")
    if [ -n "$NOTA_A_BORRAR" ]; then
        RUTA_NOTA="$DIR_NOTAS/$NOTA_A_BORRAR"
        # Confirmación antes de borrar
        CONFIRMACION=$(echo -e "Sí\nNo" | rofi -dmenu -i -p "Borrar: $NOTA_A_BORRAR?")
        if [ "$CONFIRMACION" == "Sí" ]; then
            rm "$RUTA_NOTA"
            notify-send "Notas" "Nota borrada: \n<b>$NOTA_A_BORRAR</b>"
            #rofi -e "Nota '$NOTA_A_BORRAR' eliminada."
        else 
            notify-send "Notas" "Nota no borrada"
        fi
    fi
else
    # Si se selecciona una nota existente
    ABRIR_NOTA=$(find "$DIR_NOTAS" -type f -name "$SELECCION")
    if [ -n "$ABRIR_NOTA" ]; then
        #xfce4-terminal --hold -e "nvim '$ABRIR_NOTA'"
        kitty -e nvim "$ABRIR_NOTA"
    fi
fi
