#!/bin/bash
LDA=$(awk '{print $1}' /proc/loadavg 2>/dev/null)
if [ -n "$LDA" ]; then
    printf "<b>LDA</b>  %.2f\n" "$LDA"
else
    printf "<b>LDA</b>  N/A\n"
fi
