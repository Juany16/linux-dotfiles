#!/bin/bash
dunstctl history 2>/dev/null | jq -c '[.data[0][]? | {
  appname: .summary.data,
  summary: .body.data,
  id: .id.data,
  icon: "~/.config/dunst/iconos/normal.png"
}] // []' 2>/dev/null || echo '[]'
