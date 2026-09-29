#!/usr/bin/env bash

CORNER_SIZE=20
IN_CORNER=0

while true; do
    read -r x y <<< "$(hyprctl cursorpos | tr ',' ' ')"
    fullscreen=$(hyprctl activewindow -j | jq -r '.fullscreen // 0')

    if [ "$x" -le "$CORNER_SIZE" ] && [ "$y" -le "$CORNER_SIZE" ] && [ "$fullscreen" -eq 0 ]; then
        if [ "$IN_CORNER" -eq 0 ]; then
            hyprctl dispatch 'hl.plugin.scrolloverview.overview("toggle")'
            IN_CORNER=1
        fi
    else
        IN_CORNER=0
    fi

    sleep 0.15
done
