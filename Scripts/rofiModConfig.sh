#!/bin/bash

BSPWM="/home/juani/.config/bspwm/bspwmrc"
POLYBAR="/home/juani/.config/polybar/config"
DUNST="/home/juani/.config/dunst/dunstrc"
KITTY="/home/juani/.config/kitty/kitty.conf"
PICOM="/home/juani/.config/picom/picom.conf"
ROFI="/home/juani/.config/rofi/config.rasi"
SXHKD="/home/juani/.config/sxhkd/sxhkdrc"
ZSH="/home/juani/.zshrc"
#RANGER="/home/juani/.config/ranger/"

OPCIONES=$(printf "Bspwm\nPolybar\nDunst\nKitty\nPicom\nRofi\nSxhkd\nZSH" | rofi -dmenu -i -p " ")

case "$OPCIONES" in
  "Bspwm") kitty -e nvim "$BSPWM";;
  "Polybar") kitty -e nvim "$POLYBAR";;
  "Dunst") kitty -e nvim "$DUNST";;
  "Kitty") kitty -e nvim "$KITTY";;
  "Picom") kitty -e nvim "$PICOM";;
  "Rofi") kitty -e nvim "$ROFI";;
  "Sxhkd") kitty -e nvim "$SXHKD";;
  "ZSH") kitty -e nvim "$ZSH";;
  *) exit 1 ;;
esac
