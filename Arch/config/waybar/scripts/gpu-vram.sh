#!/bin/bash
VRAM=$(radeontop -d - -l 1 2>/dev/null | grep -oP 'vram \K\d+(?=\.\d+%)')
printf "<b>VRM</b>  %d%%\n" "${VRAM:-0}"
