#!/bin/bash

status=$(nordvpn status | grep 'Status:' | awk '{print $2}')
if [[ "$status" == "Connected" ]]; then
    city=$(nordvpn status | grep 'Server:' | awk '{print $2}')
    echo " VPN: $city"
else
    echo " VPN: Disconnected"
fi
