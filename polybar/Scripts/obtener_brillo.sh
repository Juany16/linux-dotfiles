#!/bin/bash

# Obtener el brillo actual
current_brightness=$(xrandr --verbose | grep Brightness | awk '{print $2}')

# Convertir a porcentaje
brightness_percent=$(echo "$current_brightness * 100" | bc | cut -d'.' -f1)

# Mostrar el porcentaje
echo "$brightness_percent%"

