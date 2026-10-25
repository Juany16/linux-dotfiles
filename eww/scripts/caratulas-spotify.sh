#!/usr/bin/env bash
# Descarga la tapa actual y devuelve la ruta local
url=$(playerctl -p spotify metadata mpris:artUrl 2>/dev/null | sed 's/open.spotify.com/i.scdn.co/')
cache="$HOME/.cache/eww-spotify-cover.jpg"

if [ -n "$url" ] && [ "$url" != "$(cat "$cache.url" 2>/dev/null)" ]; then
    curl -s "$url" -o "$cache"
    echo "$url" > "$cache.url"
fi
echo "$cache"
