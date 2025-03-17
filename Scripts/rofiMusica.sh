#!/bin/bash

estado=$(playerctl --player=spotify status)
artista=$(playerctl --player=spotify metadata artist)
titulo=$(playerctl --player=spotify metadata title)

# Verificar si no hay canción sonando
if [[ -z "$titulo" || -z "$artista" ]]; then
    artista="Spotify"
    titulo="Spotify no está abierto"
fi

opcion=$(echo -e "$artista\n$titulo\n \n \n \n " | rofi -dmenu -i -selected-row 3 -p "󰝚 ")

case "$opcion" in
  " ") playerctl -p spotify -i brave.instance6015 previous && notify-send "Anterior" "Spotify" -u low;;
  " ") playerctl -p spotify -i brave.instance6015 play && notify-send "Spotify reproduciendo" "<b>$artista</b>\n$titulo" -u low;;
  " ") playerctl -p spotify -i brave.instance6015 pause && notify-send "Spotify pausado" "<b>$artista</b>\n$titulo" -u low;;
  " ") playerctl -p spotify -i brave.instance6015 next && notify-send "Siguiente" "Spotify" -u low;;
  *) exit 1;;
esac
