#!/usr/bin/env bash

if pgrep -f "polybar minibar" > /dev/null; then
    exit 0
fi

echo "---" | tee -a /tmp/polybar2.log
polybar minibar >> /tmp/polybar2.log 2>&1 & disown

~                                                                                                    
~  
