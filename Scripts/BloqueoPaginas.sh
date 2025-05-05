#!/bin/bash

# Sitios a bloquear
BLOCK_LIST=("reddit.com" "www.reddit.com" "www.reddit.com/r/unixporn/" "instagram.com" "www.instagram.com" "x.com" "x.com/home" "tiktok.com" "www.tiktok.com" "www.tiktok.com/es" "web.facebook.com")
HOSTS_FILE="/etc/hosts"

for site in "${BLOCK_LIST[@]}"; do
    if ! grep -q "$site" $HOSTS_FILE; then
        echo "127.0.0.1 $site" | sudo tee -a $HOSTS_FILE > /dev/null
    fi
done

echo "Modo concentración activado páginas bloqueadas"
#notify-send "Modo concentración activado" "páginas bloqueadas"

