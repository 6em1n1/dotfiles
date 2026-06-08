#!/bin/bash
for hwmon in /sys/class/hwmon/hwmon*; do
    if [ "$(cat "$hwmon/name" 2>/dev/null)" = "amdgpu" ]; then
        TEMP=$(cat "$hwmon/temp1_input" 2>/dev/null)
        if [ -n "$TEMP" ]; then
            echo "$((TEMP / 1000))°C"
            exit 0
        fi
    fi
done
echo "N/A"
