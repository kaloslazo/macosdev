#!/bin/bash

CYCLE_COUNT=$(system_profiler SPPowerDataType | grep "Cycle Count" | awk '{print $3}')

if [[ -z "$CYCLE_COUNT" ]]; then
    CYCLE_COUNT="--"
fi

sketchybar --set $NAME label="$CYCLE_COUNT" icon=""