#!/bin/bash

if xset -q | grep -q "DPMS is Enabled"; then
    echo " 󱠏 "
else
    echo " 󱠐 "
fi

