#!/bin/bash

nodes=$(bspc query -N -n '.hidden.sticky.window')

[ -z "$nodes" ] && exit

# arrays
entries=()
ids=()

for wid in $nodes; do
    title=$(xprop -id "$wid" WM_NAME | cut -d '"' -f2)
    class=$(xprop -id "$wid" WM_CLASS | awk -F '"' '{print $4}')

    entries+=("$class | $title")
    ids+=("$wid")
done

# mostrar solo texto lindo
choice=$(printf "%s\n" "${entries[@]}" | rofi -dmenu -p " ")

[ -z "$choice" ] && exit

# encontrar índice
for i in "${!entries[@]}"; do
    if [ "${entries[$i]}" = "$choice" ]; then
        wid=${ids[$i]}
        break
    fi
done

# mostrar ventana
bspc node "$wid" -g hidden=off -f
bspc node "$wid" -g sticky=off -f
