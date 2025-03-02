#!/bin/sh

CHOSEN=$(printf "󰽟   Parlantes\n  Auriculares" | rofi -dmenu -i -p " ")

case "$CHOSEN" in
    "󰽟   Parlantes") 
      pactl set-sink-port alsa_output.pci-0000_00_1f.3.analog-stereo analog-output-speaker
      notify-send "PulseAudio" "Parlantes seleccionados";;
    "  Auriculares") 
      pactl set-sink-port alsa_output.pci-0000_00_1f.3.analog-stereo analog-output-headphones
      notify-send "PulseAudio" "Auriculares seleccionados";;
	*) exit 1 ;;
esac
