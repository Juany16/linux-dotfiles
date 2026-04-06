#! /bin/bash

# current_desktop=$(bspc query -D -d --names)
# current_node=$(bspc query -N -n focused)
#
# u=$(xprop -name "Polybar tray window" _NET_WM_PID | grep -o '[[:digit:]]*')
# sleep 0.2
# kill $u
#
# bspc desktop "$current_desktop"
# [ -n "$current_node" ] && bspc node "$current_node" -f

polybar-msg -p $(pgrep -f "polybar minibar") cmd toggle
