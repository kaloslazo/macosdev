#!/bin/bash

# get current volume
VOLUME=$(osascript -e "output volume of (get volume settings)")
MUTED=$(osascript -e "output muted of (get volume settings)")

# select appropriate icon based on volume level
if [ "$MUTED" = "true" ]; then
  ICON="󰝟"
else
  case ${VOLUME} in
    100) ICON="󰕾" ;;
    9[0-9]) ICON="󰕾" ;;
    8[0-9]) ICON="󰕾" ;;
    7[0-9]) ICON="󰕾" ;;
    6[0-9]) ICON="󰖀" ;;
    5[0-9]) ICON="󰖀" ;;
    4[0-9]) ICON="󰖀" ;;
    3[0-9]) ICON="󰕿" ;;
    2[0-9]) ICON="󰕿" ;;
    1[0-9]) ICON="󰕿" ;;
    [0-9]) ICON="󰕿" ;;
    0) ICON="󰝟" ;;
    *) ICON="󰕿" ;;
  esac
fi

# display volume in sketchybar
sketchybar --set $NAME \
           icon="$ICON" \
           label="${VOLUME}%" \
           background.padding_left=10 \
           background.padding_right=10