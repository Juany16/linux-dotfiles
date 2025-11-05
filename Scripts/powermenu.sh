#!/bin/sh

confirmar(){
    printf "No\nSi" | rofi -dmenu -i -p "$1"
}

CHOSEN=$(printf "   Bloquear\n   Cerrar Sesión\n   Reiniciar\n   Apagar" | rofi -dmenu -i -p "")

case "$CHOSEN" in
    "   Bloquear") ~/.config/Scripts/blocki3lock.sh;;
    "   Cerrar Sesión")
        CONFIRMAR=$(confirmar "  Cerrar Sesión?") 
        if [ "$CONFIRMAR" = "Si" ]; then
            bspc quit
        fi;;
    "   Reiniciar")
        CONFIRMAR=$(confirmar "  Reiniciar?") 
        if [ "$CONFIRMAR" = "Si" ]; then
            reboot
        fi;;
    "   Apagar")
        CONFIRMAR=$(confirmar "  Apagar") 
        if [ "$CONFIRMAR" = "Si" ]; then
            poweroff
        fi;;
    *) exit 1 ;;
esac
