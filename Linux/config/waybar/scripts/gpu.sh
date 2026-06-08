#!/bin/bash
GPU=$(radeontop -d - -l 1 2>/dev/null | grep -oP 'gpu \K\d+(?=\.\d+%)')
echo "GPU=${GPU:-0}%"
