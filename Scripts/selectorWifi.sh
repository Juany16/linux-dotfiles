#!/bin/bash

# Obtener las redes WiFi disponibles
networks=$(nmcli -fields "SECURITY,SSID,RATE" dev wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")

# Si no hay redes disponibles, mostrar un mensaje de error
if [ -z "$networks" ]; then
    notify-send "Wifi" "No hay redes WiFi disponibles"
    #exit 1
fi

# Usar rofi para mostrar las redes y permitir que el usuario seleccione una
selected_network=$(echo -e "󰖪   Desactivar Wifi\n󱛃   Activar Wifi\n$networks" | rofi -dmenu -i -selected-row 2 -p "")

case "$selected_network" in
  "Desactivar Wifi") nmcli radio wifi off && notify-send "Wifi Desactivado" "Nmcli" && exit 1;;
  "Activar Wifi") nmcli radio wifi on && notify-send "Wifi Activado" "Nmcli" && exit 1;;
esac

# Si el usuario seleccionó una red, conectar
if [ -n "$selected_network" ]; then
    # Pedir la contraseña si es necesario
    password=$(rofi -dmenu -password -p "Contraseña para $selected_network:")

    # Intentar conectar
    nmcli dev wifi connect "$selected_network" password "$password"
fi

