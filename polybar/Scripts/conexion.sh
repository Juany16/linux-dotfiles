#!/bin/bash

if nmcli -s d | grep -q "conectado"; then
    echo "󰈀 "
else
    echo " "
fi

