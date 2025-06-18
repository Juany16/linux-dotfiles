#! /bin/bash

vnt_oculta=$(bspc query -N -n .hidden.window)

bspc node $vnt_oculta -g hidden=off; bspc node $vnt_oculta -g sticky=off -f 
