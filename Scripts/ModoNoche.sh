USB="Conexión cableada 2"

# notify-send "Modo Noche" "Activado"
# sleep 3

xsct 2800
dunstctl set-paused true
playerctl -a pause
nmcli radio wifi off
nmcli connection down "$USB"
pkill zen
pkill spotify
pkill Discord
pkill Telegram
# bash ~/.config/Scripts/BloqueoPaginas.sh
