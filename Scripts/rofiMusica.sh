#!/bin/bash

titulo=$(playerctl metadata title)
artista=$(playerctl metadata artist)

opcion=$(echo -e "$artista\n$titulo\n \n \n \n " | rofi -dmenu -i -selected-row 3 -p "󰝚 ")

case "$opcion" in
  " ") playerctl previous && notify-send "Anterior" "Playerctl";;
  " ") playerctl play && notify-send "Reproduciendo" "<b>$artista</b> $titulo";;
  " ") playerctl pause && notify-send "Pausa" "<b>$artista</b> $titulo";;
  " ") playerctl next && notify-send "Siguiente" "Playerctl";;
  *) exit 1;;
esac
