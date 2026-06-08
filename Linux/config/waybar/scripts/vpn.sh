#!/bin/bash

if ip link show proton0 &>/dev/null; then
    IP=$(ip -4 addr show proton0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    if [ -n "$IP" ]; then
        echo "{\"text\": \"<b>VPN</b>  OK\", \"tooltip\": \"ProtonVPN connected\\n$IP\", \"class\": \"connected\"}"
    else
        echo "{\"text\": \"<b>VPN</b>  OK\", \"tooltip\": \"ProtonVPN interface up (no IP)\", \"class\": \"connected\"}"
    fi
else
    echo "{\"text\": \"<b>VPN</b>  NO\", \"tooltip\": \"ProtonVPN disconnected\", \"class\": \"disconnected\"}"
fi
