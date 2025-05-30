#!/bin/bash

# Detectar el default source (micrófono) usando wpctl
MICRO=$(wpctl status | grep -A1 "Sources:" | grep '\*' | sed -E 's/[^0-9]*([0-9]+)\..*/\1/')

display_volume() {
    if [ -z "$volume" ]; then
        echo "No Mic Found"
    else
        volume="${volume//[[:blank:]]/}"
        if [[ "$mute" == *"true"* ]]; then
            echo ""
        else
            echo "  $volume"
        fi
    fi
}

case $1 in
    "show-vol")
        volume=$(wpctl get-volume $MICRO | awk '{print $2"%"}')
        mute=$(wpctl get-volume $MICRO | grep -o 'MUTED')
        if [[ "$mute" == "MUTED" ]]; then
            mute="true"
        else
            mute="false"
        fi
        display_volume
      ;;
    "inc-vol")
        wpctl set-volume $MICRO 5%+
        ;;
    "dec-vol")
        wpctl set-volume $MICRO 5%-
        ;;
    "mute-vol")
        wpctl set-mute $MICRO toggle
        ;;
    *)
        echo "Invalid script option"
        ;;
esac

