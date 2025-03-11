#!/bin/bash

artista=$(playerctl metadata artist)
titulo=$(playerctl metadata title)

# Verificar si no hay canción sonando
if [[ -z "$titulo" || -z "$artista" ]]; then
    artista="Playerctl"
    titulo="No hay reproducción"
fi

opcion=$(echo -e "$artista\n$titulo\n \n \n \n " | rofi -dmenu -i -selected-row 3 -p "󰝚 ")

case "$opcion" in
  " ") playerctl previous && notify-send "Anterior" "Playerctl" -u low;;
  " ") playerctl play && notify-send "Reproduciendo" "<b>$artista</b>\n$titulo" -u low;;
  " ") playerctl pause && notify-send "Pausa" "<b>$artista</b>\n$titulo" -u low;;
  " ") playerctl next && notify-send "Siguiente" "Playerctl" -u low;;
  *) exit 1;;
esac
