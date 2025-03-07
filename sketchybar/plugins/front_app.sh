#!/bin/bash

if [[ $SENDER == "front_app_switched" ]]; then
  LABEL="$INFO"
  sketchybar --set $NAME label="$LABEL"

else
  CURRENT_APP=$(osascript -e 'tell application "System Events" to set frontApp to name of first application process whose frontmost is true')
  sketchybar --set $NAME label="$CURRENT_APP"
fi