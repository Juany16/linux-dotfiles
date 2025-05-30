#!/bin/sh

CHOSEN=$(printf "󰽟   Parlantes\n  Auriculares" | rofi -dmenu -i -p " ")

case "$CHOSEN" in
    "󰽟   Parlantes") 
      pactl set-sink-port alsa_output.pci-0000_08_00.6.analog-stereo.4 analog-output-lineout
      notify-send "PulseAudio" "Parlantes seleccionados";;
    "  Auriculares") 
      pactl set-sink-port alsa_output.pci-0000_08_00.6.analog-stereo.4 analog-output-headphones
      notify-send "PulseAudio" "Auriculares seleccionados";;
	*) exit 1 ;;
esac
