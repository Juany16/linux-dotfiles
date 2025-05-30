#!/bin/bash

notify-send "Xset Activado" "DPMS habilitado"

xset s on     # Activa el salvapantallas
xset +dpms    # Activa gestión de energía del monitor
xset s blank  # Activa el “blanqueo” de pantalla

