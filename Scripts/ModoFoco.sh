USB="Conexión cableada 2"

paused=$(dunstctl is-paused)
if  "$paused" == "true" ; then
  dunstctl set-paused false
else
  dunstctl set-paused true
fi

bash ~/.config/Scripts/ocultarPolybar.sh
# polybar-msg cmg hide
# bspc config top_paddig 0
playerctl -a pause
# nmcli radio wifi off
# nmcli connection up "$USB"
pkill Discord
pkill Telegram
# bash ~/.config/Scripts/BloqueoPaginas.sh
