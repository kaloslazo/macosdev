#!/usr/bin/env bash

# check spotify status
if pgrep -x "Spotify" >/dev/null; then
  PLAYER_STATE=$(osascript -e 'try
    tell application "Spotify" to player state as string
  on error
    return "not running"
  end try')
  
  if [ "$PLAYER_STATE" = "playing" ]; then
    TRACK=$(osascript -e 'tell application "Spotify" to name of current track as string')
    ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track as string')
    
    sketchybar --set "$NAME" label="$TRACK - $ARTIST" drawing=on icon.drawing=on
  else
    sketchybar --set "$NAME" label="Not Playing" drawing=on icon.drawing=on
  fi
else
  sketchybar --set "$NAME" drawing=off
fi