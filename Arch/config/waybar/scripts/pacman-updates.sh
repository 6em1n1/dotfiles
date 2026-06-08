#!/bin/bash

CACHE_FILE="/tmp/waybar_pkg_count"
LOCK_FILE="/var/lib/pacman/db.lck"
MAX_RETRIES=5
RETRY_DELAY=2

waits=0
while [ -e "$LOCK_FILE" ] && [ "$waits" -lt 10 ]; do
    sleep 1
    waits=$((waits + 1))
done

for attempt in $(seq 1 "$MAX_RETRIES"); do
    OUTPUT=$(checkupdates 2>/dev/null)
    STATUS=$?

    if [ "$STATUS" -eq 0 ]; then
        COUNT=$(printf "%s\n" "$OUTPUT" | awk 'NF {c++} END {print c+0}')
        TOOLTIP=$(printf "%s\n" "$OUTPUT" | head -20 | tr '\n' ' ' | sed 's/"/\\"/g')
        printf "%s\n" "$COUNT" > "$CACHE_FILE"
        printf '{"text": "<b>PKG</b>  %d", "class": "pending", "tooltip": "%s"}\n' "$COUNT" "$TOOLTIP"
        exit 0
    fi

    if [ "$STATUS" -eq 2 ]; then
        printf "0\n" > "$CACHE_FILE"
        printf '{"text": "<b>PKG</b>  OK", "class": "updated", "tooltip": "System up to date"}\n'
        exit 0
    fi

    if [ "$attempt" -lt "$MAX_RETRIES" ]; then
        sleep "$RETRY_DELAY"
    fi
done

if [ -s "$CACHE_FILE" ]; then
    CACHED_COUNT=$(cat "$CACHE_FILE")
    if [[ "$CACHED_COUNT" =~ ^[0-9]+$ ]] && [ "$CACHED_COUNT" -gt 0 ]; then
        printf '{"text": "<b>PKG</b>  %d", "class": "pending", "tooltip": "Using cached update count (startup check failed)"}\n' "$CACHED_COUNT"
        exit 0
    fi
fi

printf '{"text": "<b>PKG</b>  ...", "class": "pending", "tooltip": "Package check retrying"}\n'
