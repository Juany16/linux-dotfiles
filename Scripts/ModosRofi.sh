modos="  Modo día\n󰖔   Modo noche\n󰯼   Modo foco"

opcion=$(echo "$modos" | rofi -dmenu -i -p "󰰑")

case "$opcion" in
  "  Modo día")
      notify-send "Modo Día"
      bash ~/.config/Scripts/ModoDia.sh;;
  "󰖔   Modo noche")
      notify-send "Modo Noche"
      bash ~/.config/Scripts/ModoNoche.sh;;
  "󰯼   Modo foco")
      notify-send "Modo Foco"
      bash ~/.config/Scripts/ModoFoco.sh;;
esac
