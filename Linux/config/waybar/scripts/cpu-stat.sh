#!/bin/bash
STATE="/tmp/waybar_cpu_stat"
read -r IDLE TOTAL < <(awk '/^cpu / {idle=$5; total=0; for(i=2;i<=NF;i++) total+=$i; print idle, total}' /proc/stat)
if [ -f "$STATE" ]; then
    IFS=' ' read -r P_IDLE P_TOTAL < "$STATE"
    DELTA_TOTAL=$(( TOTAL - P_TOTAL ))
    DELTA_IDLE=$(( IDLE - P_IDLE ))
    if [ "$DELTA_TOTAL" -gt 0 ]; then
        USAGE=$(( 100 - (DELTA_IDLE * 100 / DELTA_TOTAL) ))
    else
        USAGE=0
    fi
else
    USAGE=0
fi
printf "%d %d\n" "$IDLE" "$TOTAL" > "$STATE"
printf "CPU=%3d%%\n" "$USAGE"
