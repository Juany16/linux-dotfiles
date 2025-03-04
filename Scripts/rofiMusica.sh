#!/bin/bash

titulo=$(playerctl metadata title)
artista=$(playerctl metadata artist)

opcion=$(echo -e "$artista\n$titulo\n \n \n \n " | rofi -dmenu -i -selected-row 2 -p "󰝚 ")

case "$opcion" in
  " ") playerctl play;;
  " ") playerctl pause;;
  " ") playerctl next;;
  " ") playerctl previous;;
  *) exit 1;;
esac
