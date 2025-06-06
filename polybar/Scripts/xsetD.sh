#!/bin/bash

notify-send "Xset Desactivado" "DPMS desabilitado\nLa pantalla no se apaga"

xset s off         # Desactiva el salvapantallas
xset -dpms         # Desactiva gestión de energía del monitor
xset s noblank     # Evita el “blanqueo” de pantalla
