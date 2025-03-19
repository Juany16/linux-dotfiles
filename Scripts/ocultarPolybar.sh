#! /usr/bin/bash

opcion=$(echo -e "Ocultar barra\nMostrar barra" | rofi -dmenu -i -p "polybar")

case "$opcion" in
  "Ocultar barra") pkill polybar && bspc config top_padding 0;;
  "Mostrar barra") bspc wm -r;;
esac
