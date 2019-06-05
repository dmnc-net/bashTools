#!/bin/bash

# NetworkManager: turns OFF/ON WiFi automaticaly if the wired connection is plugged/unplugged
# disconnecting radio if wlan and eth has the same subnet

if [ "$1" = "eth0" ]; then
 WLAN=`ip a s dev wlan0|grep inet|grep brd|awk '{print $4}'`
 ETH=`ip a s dev eth0|grep inet|grep brd|awk '{print $4}'`
    case "$2" in
        up)
            if [ "$WLAN" == "$ETH" ]; then nmcli radio wifi off; fi
            ;;
        down)
            nmcli radio wifi on
            ;;
    esac
fi
