#!/bin/bash

estado=$(playerctl --ignore-player=spotify status)
artista=$(playerctl --ignore-player=spotify metadata artist)
titulo=$(playerctl --ignore-player=spotify metadata title)

# Verificar si no hay canción sonando
if [[ -z "$titulo" || -z "$artista" ]]; then
    artista="YouTube"
    titulo="YouTube no está abierto"
fi

opcion=$(echo -e "$artista\n$titulo\n \n \n \n " | rofi -dmenu -i -selected-row 3 -p " ") #󰝚 ")

case "$opcion" in
  " ") playerctl -i spotify previous && notify-send "Anterior" "YouTube" -u low;;
  " ") playerctl -i spotify play && notify-send "YouTube reproduciendo" "<b>$artista</b>\n$titulo" -u low;;
  " ") playerctl -i spotify pause && notify-send "YouTube pausado" "<b>$artista</b>\n$titulo" -u low;;
  " ") playerctl -i spotify next && notify-send "Siguiente" "YouTube" -u low;;
  *) exit 1;;
esac
