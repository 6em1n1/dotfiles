#!/bin/bash

ONLINE=""
for dev in /sys/class/power_supply/*; do
    [ -f "$dev/type" ] || continue
    if [ "$(cat "$dev/type" 2>/dev/null)" = "Mains" ]; then
        ONLINE=$(cat "$dev/online" 2>/dev/null)
        break
    fi
done

if [ "$ONLINE" = "1" ]; then
    printf "<b>PWR</b>  OK\n"
elif [ "$ONLINE" = "0" ]; then
    printf "<b>PWR</b>  NO\n"
else
    printf "<b>PWR</b>  NO\n"
fi
