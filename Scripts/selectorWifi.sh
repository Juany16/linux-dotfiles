#!/bin/bash

# Obtener las redes WiFi disponibles (SSID + señal + seguridad)
networks=$(nmcli -t -f SSID,SECURITY,SIGNAL dev wifi list | awk -F: '!seen[$1]++ && $1 != "" { 
  icon = ($2 ~ /WPA|WEP/) ? "" : "";
  signal = ($3 > 75) ? "" : ($3 > 50) ? "" : "";
  printf "%s %s (%s)\n", icon, $1, signal;
}')

# Agregar opciones para activar/desactivar wifi
menu="󰖪  Desactivar Wifi\n󱛃  Activar Wifi\n$networks"

# Mostrar en rofi
selected=$(echo -e "$menu" | rofi -dmenu -i -p "  Redes WiFi")

# Acciones especiales
case "$selected" in
  "󰖪  Desactivar Wifi") nmcli radio wifi off && notify-send "WiFi" "WiFi desactivado" && exit ;;
  "󱛃  Activar Wifi") nmcli radio wifi on && notify-send "WiFi" "WiFi activado" && exit ;;
esac

# Extraer solo el SSID de la línea seleccionada
ssid=$(echo "$selected" | sed -E 's/^[^ ]+ (.+) \(.*\)/\1/')

# Verificar si la red ya está guardada
if nmcli connection show | grep -q "$ssid"; then
  nmcli connection up "$ssid" && notify-send "WiFi" "Conectado a $ssid"
else
  # Solicitar contraseña si no está guardada
  password=$(rofi -dmenu -password -p "Contraseña para $ssid:")
  [ -n "$password" ] && nmcli dev wifi connect "$ssid" password "$password" && notify-send "WiFi" "Conectado a $ssid"
fi

