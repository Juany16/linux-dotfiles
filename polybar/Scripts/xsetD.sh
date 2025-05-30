#!/bin/bash

notify-send "Xset Desactivado" "DPMS desabilitado"

xset s off         # Desactiva el salvapantallas
xset -dpms         # Desactiva gestión de energía del monitor
xset s noblank     # Evita el “blanqueo” de pantalla
