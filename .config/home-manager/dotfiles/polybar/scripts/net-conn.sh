#!/bin/bash

# Get default route interface
iface=$(ip route get 8.8.8.8 2>/dev/null | awk '{for(i=1;i<=NF;i++) if ($i=="dev") print $(i+1)}')

# Check if interface is Wi-Fi
if [[ "$iface" =~ ^wl ]]; then
    ssid=$(iw dev "$iface" info | awk -F'ssid ' '/ssid/ {print $2}')
    echo "Wifi: ${ssid:-unknown}"
elif [[ "$iface" =~ ^en || "$iface" =~ ^eth ]]; then
    echo "ETH: connected"
else
    echo "No Network"
fi
