#!/bin/bash
# Caps Lock indicator for hyprlock

if xset q | grep "Caps Lock:   on" > /dev/null 2>&1; then
    echo "󰘲  Caps Lock ON"
else
    echo ""
fi
