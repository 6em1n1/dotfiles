#!/bin/bash
PCT=$(df / --output=pcent 2>/dev/null | tail -1 | tr -d ' %')
printf "DSK=%3d%%\n" "${PCT:-0}"
