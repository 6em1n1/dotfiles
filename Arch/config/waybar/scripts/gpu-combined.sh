#!/bin/bash
GPU=$(radeontop -d - -l 1 2>/dev/null | grep -oP 'gpu \K\d+(?=\.\d+%)')

for hwmon in /sys/class/hwmon/hwmon*; do
    if [ "$(cat "$hwmon/name" 2>/dev/null)" = "amdgpu" ]; then
        TEMP=$(cat "$hwmon/temp1_input" 2>/dev/null)
        if [ -n "$TEMP" ]; then
            printf "<b>GPU</b>  %d%% %d°C\n" "${GPU:-0}" $(( TEMP / 1000 ))
            exit 0
        fi
    fi
done
printf "<b>GPU</b>  %d%%\n" "${GPU:-0}"
