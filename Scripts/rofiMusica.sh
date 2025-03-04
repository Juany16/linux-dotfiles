#!/bin/bash

titulo=$(playerctl metadata title)
artista=$(playerctl metadata artist)

opcion=$(echo -e "$artista\n$titulo\n \n \n \n " | rofi -dmenu -i -selected-row 3 -p "󰝚 ")

case "$opcion" in
  " ") playerctl previous && notify-send "Playerctl" "Canción anterior";;
  " ") playerctl play && notify-send "Playerctl" "Play";;
  " ") playerctl pause && notify-send "Playerctl" "Pausa";;
  " ") playerctl next && notify-send "Playerctl" "Siguiente canción";;
  *) exit 1;;
esac
