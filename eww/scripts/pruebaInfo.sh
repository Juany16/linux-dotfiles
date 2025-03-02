#!/bin/bash

# Obtener el uso de CPU
cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
#cpu=grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}' | tr '.' ' ' | awk '{print $1}'
# Obtener el uso de RAM
ram=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
# Obtener el uso de disco
disk=$(df -h / | grep / | awk '{ print $5 }')

echo "$cpu"
echo "$ram"
echo "$disk"
