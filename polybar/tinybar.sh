#!/usr/bin/env bash

echo "---" | tee -a /tmp/polybar2.log
polybar minibar >> /tmp/polybar2.log 2>&1 & disown

~                                                                                                    
~  
# sleep 0.2
# polybar-msg -p $(pgrep -f "polybar minibar") cmd hide
