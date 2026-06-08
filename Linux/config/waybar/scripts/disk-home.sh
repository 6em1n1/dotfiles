#!/bin/bash
PCT=$(df /home --output=pcent 2>/dev/null | tail -1 | tr -d ' %')
printf "HOM=%3d%%\n" "${PCT:-0}"
