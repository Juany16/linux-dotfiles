#!/bin/bash

# Ruta al archivo de tareas
archivo="$HOME/.tareasEww.txt"

grep -vP '\x1B\[[0-9;]*[mK]' "$archivo"
