#!/usr/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3

## Simple Script To Pick Color Quickly.

color=$(gpick -pso --no-newline)
image=/tmp/${color}.png

main() {
	if [[ "$color" ]]; then
	
        	# copy color code to clipboard
		echo $color | tr -d "\n" | xclip -selection clipboard
		# generate preview
		convert -size 48x48 xc:"$color" ${image}
		# notify about it
		dunstify -u low --replace=69 -i ${image} "$color, copiado"
	fi
}

# Run the script
main
