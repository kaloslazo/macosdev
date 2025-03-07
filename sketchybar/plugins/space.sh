#!/bin/bash

CURRENT_SPACE=$(yabai -m query --spaces --space | jq '.index')

SPACE_INDEX=$(echo "$NAME" | sed 's/[^0-9]*//g')

if [[ "$CURRENT_SPACE" == "$SPACE_INDEX" ]]; then
  sketchybar --set "$NAME" icon.color=0xff61AFEF
else
  sketchybar --set "$NAME" icon.color=0xffCCCCCC
fi