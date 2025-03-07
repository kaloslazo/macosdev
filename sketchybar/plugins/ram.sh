#!/bin/bash

CPU_USAGE=$(top -l 1 | grep "^CPU" | awk '{print $3 + $5"%"}')

sketchybar --set $NAME label="$CPU_USAGE"