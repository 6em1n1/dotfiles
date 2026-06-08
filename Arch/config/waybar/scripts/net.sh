#!/bin/bash
IFACE="wlp2s0"
IP=$(ip -4 addr show "$IFACE" 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
printf "NET=%-15s\n" "${IP:-off}"
