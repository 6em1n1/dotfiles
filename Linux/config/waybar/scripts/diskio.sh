#!/bin/bash
DEV=$(lsblk -d -o NAME,TYPE 2>/dev/null | awk '$2=="disk"{print $1}' | head -1)
STATE="/tmp/waybar_dio_${DEV}"

STATS=$(cat "/sys/block/${DEV}/stat" 2>/dev/null)
if [ -z "$STATS" ]; then
    echo "<b>DIO</b>  N/A"
    exit 0
fi

SECTORS_R=$(echo $STATS | awk '{print $3}')
SECTORS_W=$(echo $STATS | awk '{print $7}')
NOW=$(date +%s%3N)

fmt() {
    if   [ "$1" -ge 1073741824 ]; then printf "%3dG" $(( $1 / 1073741824 ))
    elif [ "$1" -ge 1048576 ];    then printf "%3dM" $(( $1 / 1048576 ))
    elif [ "$1" -ge 1024 ];       then printf "%3dK" $(( $1 / 1024 ))
    else                               printf "%3dB" "$1"
    fi
}

if [ -f "$STATE" ]; then
    IFS=' ' read -r PREV_R PREV_W PREV_TIME < "$STATE"
    DELTA=$(( NOW - PREV_TIME ))
    if [ "$DELTA" -gt 0 ]; then
        R_RATE=$(( (SECTORS_R - PREV_R) * 512 * 1000 / DELTA ))
        W_RATE=$(( (SECTORS_W - PREV_W) * 512 * 1000 / DELTA ))
        printf "<b>DIO</b>  %s\u2193%s\u2191\n" "$(fmt "$R_RATE")" "$(fmt "$W_RATE")"
    else
        printf "<b>DIO</b>  ---\u2193 ---\u2191\n"
    fi
else
    printf "<b>DIO</b>  ---\u2193 ---\u2191\n"
fi

printf "%s %s %s\n" "$SECTORS_R" "$SECTORS_W" "$NOW" > "$STATE"
