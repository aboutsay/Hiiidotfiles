#!/usr/bin/env bash

CORNER_SIZE=3
IN_CORNER=0

SCREEN_HEIGHT=$(/usr/bin/hyprctl monitors -j | jq -r '.[0].height // 1080')



while true; do
    read -r x y <<< "$(/usr/bin/hyprctl cursorpos | tr ',' ' ')"
    fullscreen=$(/usr/bin/hyprctl activewindow -j | jq -r '.fullscreen // 0')

    y_limit=$((SCREEN_HEIGHT - CORNER_SIZE))

    # Check ONLY Bottom-Left Corner
    if [ "$x" -le "$CORNER_SIZE" ] && [ "$y" -ge "$y_limit" ] && [ "$fullscreen" -eq 0 ]; then
        if [ "$IN_CORNER" -eq 0 ]; then
            
            # Read real state: Only execute if the overview is ALREADY open/active
            if ; then
                # 1. Focus next workspace
                /usr/bin/hyprctl dispatch 'hl.dsp.focus({ workspace = "+1" })'
                
                # 2. Close overview
                /usr/bin/hyprctl dispatch 'hl.plugin.scrolloverview.overview("toggle")'
                
                IN_CORNER=1
            fi
        fi
    else
        IN_CORNER=0
    fi

    sleep 0.1
done