#!/bin/bash

# Ajustar el brillo hacia arriba o hacia abajo
# Uso: brightness.sh up|down

if [[ $1 == "up" ]]; then
    xrandr --output eDP-1 --brightness $(echo "$(xrandr --verbose | grep Brightness | awk '{print $2}') + 0.1" | bc)
elif [[ $1 == "down" ]]; then
    xrandr --output eDP-1 --brightness $(echo "$(xrandr --verbose | grep Brightness | awk '{print $2}') - 0.1" | bc)
fi

