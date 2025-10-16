USB="Conexión cableada 2"

# notify-send "Modo Foco" "Activado"
# sleep 3

pkill polybar
bspc config top_padding 0
dunstctl set-paused true
playerctl -a pause
nmcli radio wifi off
nmcli connection up "$USB"
pkill Discord
pkill Telegram
# bash ~/.config/Scripts/BloqueoPaginas.sh
