#!/bin/bash

BSPWM="$HOME/.config/bspwm/bspwmrc"
POLYBAR="$HOME/.config/polybar/config"
DUNST="$HOME/.config/dunst/dunstrc"
KITTY="$HOME/.config/kitty/kitty.conf"
PICOM="$HOME/.config/picom/picom.conf"
ROFI="$HOME/.config/rofi/config.rasi"
SXHKD="$HOME/.config/sxhkd/sxhkdrc"
ZSH="$HOME/.zshrc"

SCRIPTS="$HOME/.config/Scripts/"
CONFIGS="$HOME/.config/"
EWW="$HOME/.config/eww/"
RANGER="$HOME/.config/ranger/"

OPCIONES=$(printf "Bspwm\nPolybar\nDunst\nKitty\nPicom\nRofi\nSxhkd\nZSH\nScripts\nConfigs\nEww\nRanger" | rofi -dmenu -i -p " ")

case "$OPCIONES" in
  "Bspwm") kitty -e nvim "$BSPWM";;
  "Polybar") kitty -e nvim "$POLYBAR";;
  "Dunst") kitty -e nvim "$DUNST";;
  "Kitty") kitty -e nvim "$KITTY";;
  "Picom") kitty -e nvim "$PICOM";;
  "Rofi") kitty -e nvim "$ROFI";;
  "Sxhkd") kitty -e nvim "$SXHKD";;
  "ZSH") kitty -e nvim "$ZSH";;
  "Scripts") kitty -e ranger "$SCRIPTS";;
  "Configs") kitty -e ranger "$CONFIGS";;
  "Eww") kitty -e ranger "$EWW";;
  "Ranger") kitty -e ranger "$RANGER";;
  *) exit 1 ;;
esac
