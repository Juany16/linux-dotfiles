USB="Conexión cableada 2"

bspc wm -r
dunstctl set-paused false
xsct 6500
playerctl -a pause
nmcli radio wifi off
nmcli connection up "$USB"
# bash ~/.config/Scripts/DesbloqueoPaginas.sh

# notify-send "Modo Día" "Activado"
