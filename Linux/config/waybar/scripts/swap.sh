#!/bin/bash
TOTAL=$(awk '/^SwapTotal:/{print $2}' /proc/meminfo)
FREE=$(awk '/^SwapFree:/{print $2}' /proc/meminfo)
if [ "$TOTAL" -gt 0 ]; then
    PCT=$(( (TOTAL - FREE) * 100 / TOTAL ))
else
    PCT=0
fi
printf "SWP=%3d%%\n" "$PCT"
