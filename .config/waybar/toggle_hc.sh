#!/usr/bin/env bash

if pgrep -f "hotcorner.sh" > /dev/null; then
    pkill -f "hotcorner.sh"
    pw-play ~/.config/hypr/sounds/ws4.mp3 &
else
    ~/.config/hypr/scripts/hotcorner.sh &
    pw-play ~/.config/hypr/sounds/ws1.mp3 &
fi
