#!/bin/bash

# Obtener las redes WiFi disponibles
networks=$(nmcli -t -f SSID dev wifi list)

# Si no hay redes disponibles, mostrar un mensaje de error
if [ -z "$networks" ]; then
    echo "No hay redes WiFi disponibles."
    exit 1
fi

# Usar rofi para mostrar las redes y permitir que el usuario seleccione una
selected_network=$(echo "$networks" | rofi -dmenu -i -p "")

# Si el usuario seleccionó una red, conectar
if [ -n "$selected_network" ]; then
    # Pedir la contraseña si es necesario
    password=$(rofi -dmenu -password -p "Contraseña para $selected_network:")

    # Intentar conectar
    nmcli dev wifi connect "$selected_network" password "$password"
fi

