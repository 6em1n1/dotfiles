#!/bin/bash
# CPU usage
STATE="/tmp/waybar_cpu_stat"
read -r IDLE TOTAL < <(awk '/^cpu / {idle=$5; total=0; for(i=2;i<=NF;i++) total+=$i; print idle, total}' /proc/stat)
if [ -f "$STATE" ]; then
    IFS=' ' read -r P_IDLE P_TOTAL < "$STATE"
    DELTA_TOTAL=$(( TOTAL - P_TOTAL ))
    DELTA_IDLE=$(( IDLE - P_IDLE ))
    [ "$DELTA_TOTAL" -gt 0 ] && USAGE=$(( 100 - (DELTA_IDLE * 100 / DELTA_TOTAL) )) || USAGE=0
else
    USAGE=0
fi
printf "%d %d\n" "$IDLE" "$TOTAL" > "$STATE"

# CPU temp
for hwmon in /sys/class/hwmon/hwmon*; do
    NAME=$(cat "$hwmon/name" 2>/dev/null)
    if [[ "$NAME" == "coretemp" || "$NAME" == "k10temp" || "$NAME" == "zenpower" ]]; then
        TEMP=$(cat "$hwmon/temp1_input" 2>/dev/null)
        if [ -n "$TEMP" ]; then
            printf "<b>CPU</b>  %d%% %d°C\n" "$USAGE" $(( TEMP / 1000 ))
            exit 0
        fi
    fi
done
printf "<b>CPU</b>  %d%%\n" "$USAGE"
