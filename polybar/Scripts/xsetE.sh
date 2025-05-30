#!/bin/bash

if xset -q | grep -q "DPMS is Enabled"; then
    echo " 󰍹  "
    #echo " 󱠏 "
else
    echo " 󰶐  "
    #echo " 󱠐 "
fi

