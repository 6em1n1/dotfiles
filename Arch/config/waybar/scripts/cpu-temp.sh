#!/bin/bash
for hwmon in /sys/class/hwmon/hwmon*; do
    NAME=$(cat "$hwmon/name" 2>/dev/null)
    if [[ "$NAME" == "coretemp" || "$NAME" == "k10temp" || "$NAME" == "zenpower" ]]; then
        TEMP=$(cat "$hwmon/temp1_input" 2>/dev/null)
        if [ -n "$TEMP" ]; then
            printf "%3d°C\n" $(( TEMP / 1000 ))
            exit 0
        fi
    fi
done
printf "  ?°C\n"
