#! /bin/bash

VENV="$HOME/.config/Scripts/.venv"

source "$VENV/bin/activate"

python3 "$HOME/.config/Scripts/BlackJack2.py"

deactivate
