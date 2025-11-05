#! /bin/bash

USB="Conexión cableada 2"
WIFI="BICICLETA 2.4"

opciones="󰕓  Modem USB\n    Wifi\n󱡺   Apagar Redes"

elegido=$(echo -e "$opciones" | rofi -dmenu -i -p " ")

case "$elegido" in
  "󰕓  Modem USB") 
      notify-send "Redes" "USB seleccionado"
      nmcli radio wifi off 
      nmcli connection up "$USB"
      echo "󰈀 ";;
  "    Wifi") 
      notify-send "Redes" "Wifi seleccionado"
      nmcli radio wifi on
      nmcli connection down "$USB"
      echo " ";;
  "󱡺   Apagar Redes")
      notify-send "Redes" "Redes apagadas"
      nmcli radio wifi off
      nmcli connection down "$USB"
      echo "󱡺 ";;
esac

