#!/bin/bash

for bat in /sys/class/power_supply/BAT*; do
    [ -f "$bat/voltage_now" ] || continue
    UV=$(cat "$bat/voltage_now" 2>/dev/null)
    if [[ "$UV" =~ ^[0-9]+$ ]] && [ "$UV" -gt 0 ]; then
        VOLT=$(LC_NUMERIC=C awk -v uv="$UV" 'BEGIN { printf "%.2f", uv / 1000000 }')
        printf "<b>VTG</b>  %sV\n" "$VOLT"
        exit 0
    fi
done

printf "<b>VTG</b>  N/A\n"
