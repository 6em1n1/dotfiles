#!/bin/bash
TOTAL=$(awk '/^MemTotal:/{print $2}' /proc/meminfo)
AVAIL=$(awk '/^MemAvailable:/{print $2}' /proc/meminfo)
USED=$(( TOTAL - AVAIL ))
PCT=$(( USED * 100 / TOTAL ))
printf "MEM=%3d%%\n" "$PCT"
