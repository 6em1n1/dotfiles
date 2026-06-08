#!/bin/bash
FAILED_UNITS=$(systemctl list-units --state=failed --no-legend --no-pager 2>/dev/null | awk 'NF {print $1}')
COUNT=$(printf "%s\n" "$FAILED_UNITS" | awk 'NF {c++} END {print c+0}')

if [ "$COUNT" -eq 0 ] || [ -z "$FAILED_UNITS" ]; then
    printf '{"text": "<b>SYS</b>  OK", "class": "ok", "tooltip": "All units healthy"}\n'
else
    TOOLTIP=$(echo "$FAILED_UNITS" | tr '\n' ' ')
    printf '{"text": "<b>SYS</b>  %d", "class": "failed", "tooltip": "Failed: %s"}\n' "$COUNT" "$TOOLTIP"
fi
