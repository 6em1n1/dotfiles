#!/bin/bash
IFACE="wlp2s0"
STATE="/tmp/waybar_bw_${IFACE}"

RX=$(cat "/sys/class/net/${IFACE}/statistics/rx_bytes" 2>/dev/null || echo 0)
TX=$(cat "/sys/class/net/${IFACE}/statistics/tx_bytes" 2>/dev/null || echo 0)
NOW=$(date +%s%3N)

fmt() {
    if   [ "$1" -ge 1073741824 ]; then printf "%3dG" $(( $1 / 1073741824 ))
    elif [ "$1" -ge 1048576 ];    then printf "%3dM" $(( $1 / 1048576 ))
    elif [ "$1" -ge 1024 ];       then printf "%3dK" $(( $1 / 1024 ))
    else                               printf "%3dB" "$1"
    fi
}

if [ -f "$STATE" ]; then
    IFS=' ' read -r PREV_RX PREV_TX PREV_TIME < "$STATE"
    DELTA=$(( NOW - PREV_TIME ))
    if [ "$DELTA" -gt 0 ]; then
        RX_RATE=$(( (RX - PREV_RX) * 1000 / DELTA ))
        TX_RATE=$(( (TX - PREV_TX) * 1000 / DELTA ))
        printf "<b>BND</b>  %s\u2193%s\u2191\n" "$(fmt "$RX_RATE")" "$(fmt "$TX_RATE")"
    else
        printf "<b>BND</b>  ---\u2193 ---\u2191\n"
    fi
else
    printf "<b>BND</b>  ---\u2193 ---\u2191\n"
fi

printf "%s %s %s\n" "$RX" "$TX" "$NOW" > "$STATE"
