#!/bin/bash

WIFI_SSID=$(system_profiler SPAirPortDataType | awk '/Current Network Information:/{getline; print $1; exit}' | sed 's/:.*//' | awk '{$1=$1};1')
WIFI_POWER=$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | grep "agrCtlRSSI" | awk '{print $2}')

if [[ -z "$WIFI_SSID" ]]; then
    sketchybar --set $NAME label="offline" icon="󰤫 "
else
    ICON="󰤨 "
    
    if [[ ! -z "$WIFI_POWER" ]] && [[ "$WIFI_POWER" =~ ^-?[0-9]+$ ]]; then
        if (( WIFI_POWER > -50 )); then
            ICON="󰤨 "
        elif (( WIFI_POWER > -70 )); then
            ICON="󰤢"
        else
            ICON="󰤟"
        fi
    fi
    
    sketchybar --set $NAME label="$WIFI_SSID" icon="$ICON"
fi