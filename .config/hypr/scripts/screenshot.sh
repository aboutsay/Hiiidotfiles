#!/bin/bash
FILE="$HOME/Pictures/screenshots/$(date +'%Y-%m-%d-%H%M%S_screenshot.png')"
grim - | tee "$FILE" | setsid wl-copy

# fuck lua language man waaaa3
