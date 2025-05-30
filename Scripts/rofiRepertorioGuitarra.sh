#!/bin/bash

DIR_NOTAS="$HOME/Documentos/Repertorio Guitarra/"

if [ -z "$DIR_NOTAS" ]; then
    echo "No hay temas disponibles."
    exit 1
fi

# Opción para crear una nueva nota
OPCIONES="  Agregar un nuevo tema\n  Borrar tema\n$(
    find "$DIR_NOTAS" -type f -name "*.txt" -exec basename {} \;
)"

# Seleccionar opción en rofi
SELECCION=$(echo -e "$OPCIONES" | rofi -dmenu -i -p " ")

# Si la opción es "Crear nueva nota"
if [[ "$SELECCION" == "  Agregar un nuevo tema" ]]; then
    NOMBRE_NOTA=$(rofi -dmenu -i -p "Nombre del tema: ")
    if [ -n "$NOMBRE_NOTA" ]; then
        RUTA_NOTA="$DIR_NOTAS/$NOMBRE_NOTA.txt"
        touch "$RUTA_NOTA"
        notify-send "Repertorio" "Tema agregado: \n<b>$NOMBRE_NOTA</b>"
        #xfce4-terminal --hold -e "nvim '$RUTA_NOTA'"
        kitty -e nvim "$ABRIR_NOTA"
    fi
# Si se selecciona "Borrar nota"
elif [[ "$SELECCION" == "  Borrar tema" ]]; then
    NOTA_A_BORRAR=$(find "$DIR_NOTAS" -type f -name "*.txt" -exec basename {} \; | rofi -dmenu -i -p "Seleccioná el tema a borrar: ")
    if [ -n "$NOTA_A_BORRAR" ]; then
        RUTA_NOTA="$DIR_NOTAS/$NOTA_A_BORRAR"
        # Confirmación antes de borrar
        CONFIRMACION=$(echo -e "Sí\nNo" | rofi -dmenu -i -p "Borrar: $NOTA_A_BORRAR?")
        if [ "$CONFIRMACION" == "Sí" ]; then
            rm "$RUTA_NOTA"
            notify-send "Repertorio" "Tema borrado: \n<b>$NOTA_A_BORRAR</b>"
            #rofi -e "Nota '$NOTA_A_BORRAR' eliminada."
        else 
            notify-send "Repertorio" "Tema no borrado"
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
