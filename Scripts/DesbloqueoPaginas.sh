#!/bin/bash

# Sitios a desbloquear
BLOCK_LIST=("reddit.com" "www.reddit.com" "www.reddit.com/r/unixporn/" "instagram.com" "www.instagram.com" "x.com" "x.com/home" "tiktok.com" "www.tiktok.com" "www.tiktok.com/es" "web.facebook.com")
HOSTS_FILE="/etc/hosts"

for site in "${BLOCK_LIST[@]}"; do
    sudo sed -i "/$site/d" $HOSTS_FILE
done

#notify-send "Sitios desbloqueados" "Reddit y otros fueron desbloqueados" -u normal

