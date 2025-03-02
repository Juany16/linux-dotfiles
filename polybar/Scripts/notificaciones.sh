#!/bin/bash

if [ $(dunstctl is-paused) == false ]; then
  #dunstctl set-paused false
  echo "󰂚 "
else
  #dunstctl set-paused true
  echo "󰂛 "
fi

