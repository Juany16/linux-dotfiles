#! /usr/bin/bash

opcion=$(echo -e "Ocultar barra\nMostrar barra" | rofi -dmenu -i -p " ")

case "$opcion" in
  "Ocultar barra") pkill polybar && bspc config top_padding 0 && dunstctl set-paused true;;
  "Mostrar barra") bspc wm -r && dunstctl set-paused false;;
esac
