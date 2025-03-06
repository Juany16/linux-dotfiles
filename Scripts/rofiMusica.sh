#!/bin/bash

titulo=$(playerctl metadata title)
artista=$(playerctl metadata artist)

opcion=$(echo -e "$artista\n$titulo\n \n \n \n " | rofi -dmenu -i -selected-row 3 -p "󰝚 ")

case "$opcion" in
  #"$artista") brave-browser "https://search.brave.com/search?q=$(playerctl metadata -f '{{xesam:artist}}')";;
  #"$titulo") brave-browser "https://search.brave.com/search?q=$(playerctl metadata -f '{{xesam:title}} {{xesam:artist}}') cifra club";;
  #"$titulo") brave-browser "https://genius.com/search?q=$(playerctl metadata -f '{{xesam:title}} {{xesam:artist}}')";;
  " ") playerctl previous && notify-send "Anterior" "Playerctl";;
  " ") playerctl play && notify-send "Reproduciendo" "<b>$artista</b>\n$titulo";;
  " ") playerctl pause && notify-send "Pausa" "<b>$artista</b>\n$titulo";;
  " ") playerctl next && notify-send "Siguiente" "Playerctl";;
  *) exit 1;;
esac
