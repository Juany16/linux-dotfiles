#!/bin/bash

# Matar programas antes de bloquear
playerctl pause
eww close-all
dunstctl set-paused true
pkill xfce4-notifyd
#pkill dunst

# Bloquear
i3lock -i "$(cat ~/.fondo_actual.txt)" -u &
#sleep 1
#eww open reloj

while pgrep -x "i3lock" > /dev/null; do
    sleep 1  # Revisa cada segundo si i3lock sigue en ejecución
done

# Reanudar despues de desbloquear
dunstctl set-paused false

#eww close reloj
#dunst -conf ~/.config/dunst/dunstrc &

