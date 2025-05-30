#! /bin/bash

VENV="$HOME/.config/Scripts/.venv"
#echo $VENV

source "$VENV/bin/activate"

python3 "$HOME/.config/Scripts/ClimaWTTR-VCP.py"

deactivate
