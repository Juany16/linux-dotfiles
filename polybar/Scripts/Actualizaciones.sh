#!/bin/bash

# Ejecuta el comando y cuenta las líneas
#COUNT=$(apt-get -s upgrade | grep -c '^Inst')
COUNT=$(apt list --upgradable 2> /dev/null | grep -c "/")

# Muestra el resultado
if [ "$COUNT" -eq 0 ]; then
  #echo "  0"
  echo ""
else
  echo "  $COUNT"
fi

