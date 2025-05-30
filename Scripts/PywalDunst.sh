#!/bin/bash

# Ruta del archivo de colores
colores=~/.cache/wal/colors

# Obtener colores específicos de Pywal
color0=$(sed -n '1p' "$colores")   # background
color7=$(sed -n '8p' "$colores")   # foreground
color2=$(sed -n '8p' "$colores")   # frame color

# Reemplazar en dunstrc
sed -i "s/^background = .*/background = \"$color0\"/" ~/.config/dunst/dunstrc
sed -i "s/^foreground = .*/foreground = \"$color7\"/" ~/.config/dunst/dunstrc
sed -i "s/^frame_color = .*/frame_color = \"$color2\"/" ~/.config/dunst/dunstrc

# Reiniciar Dunst para aplicar cambios
killall dunst && dunst &

