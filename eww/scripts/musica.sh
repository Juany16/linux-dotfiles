#! /usr/bin/bash

estado=$(playerctl status)
cancion=$(playerctl metadata title)
artista=$(playerctl metadata artist)

if [[ -z "$titulo" || -z "$artista" ]]; then
    artista="Playerctl"
    titulo="No hay reproducción"
fi

echo $cancion
echo $artista
