#!/bin/bash

# get battery information
PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

# select icon based on battery level and charging status
if [[ $CHARGING != "" ]]; then
  case ${PERCENTAGE} in
    9[0-9]|100) ICON="󰂅" ;;
    8[0-9]) ICON="󰂋" ;;
    7[0-9]) ICON="󰂊" ;;
    6[0-9]) ICON="󰢞" ;;
    5[0-9]) ICON="󰂉" ;;
    4[0-9]) ICON="󰢝" ;;
    3[0-9]) ICON="󰂈" ;;
    2[0-9]) ICON="󰂇" ;;
    1[0-9]) ICON="󰂆" ;;
    [0-9]) ICON="󰢜" ;;
  esac
else
  case ${PERCENTAGE} in
    9[0-9]|100) ICON="󰁹" ;;
    8[0-9]) ICON="󰂂" ;;
    7[0-9]) ICON="󰂁" ;;
    6[0-9]) ICON="󰂀" ;;
    5[0-9]) ICON="󰁿" ;;
    4[0-9]) ICON="󰁾" ;;
    3[0-9]) ICON="󰁽" ;;
    2[0-9]) ICON="󰁼" ;;
    1[0-9]) ICON="󰁻" ;;
    [0-9]) ICON="󰁺" ;;
  esac
fi

# display battery percentage in sketchybar
sketchybar --set $NAME icon="$ICON" label="${PERCENTAGE}%" background.padding_left=10
