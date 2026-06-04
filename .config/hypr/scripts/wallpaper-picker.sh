#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

#make rofi ready first ma boy
selected=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | \
  while read -r img; do
    echo -e "$(basename "$img")\x00icon\x1f$img"
  done | rofi -theme gruvbox-dark -dmenu -i \
    -p "󰋩 Wallpaper" \
    -theme-str 'window {width: 70%; height: 70%;}' \
    -theme-str 'listview {columns: 4; lines: 3;}' \
    -show-icons \
    -icon-theme "hicolor")

if [ -n "$selected" ]; then
  awww img "$WALLPAPER_DIR/$selected" \
    --transition-type wipe \
    --transition-duration 1
fi
