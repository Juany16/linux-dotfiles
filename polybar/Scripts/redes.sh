#! /bin/bash

ruta_ip=$(ip route)

if ip route | grep -q "enx025605063761"; then
    echo "󰈀 "
elif ip route | grep -q "wlxc0252ff9aa23"; then
    echo " "
elif  ip route | grep -q "enx025605063761"  &&  ip route | grep -q "wlxc0252ff9aa23" ; then
    echo "󰈀  "
elif [ -z "$ruta_ip" ]; then
    echo "󰀝 "
else
  echo " "
fi
