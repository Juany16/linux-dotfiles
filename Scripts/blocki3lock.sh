#!/bin/bash

# Ruta a la imagen de fondo que quieres usar
#background_image="$(cat /tmp/fondo_actual.txt)"

# Bloquear la pantalla con la nueva imagen
#i3lock -i "$(cat /tmp/fondo_actual.txt)" -u
playerctl pause
eww close-all
i3lock -i "$(cat ~/.fondo_actual.txt)" -u

