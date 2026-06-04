#!/bin/bash

VIDEO_DIR="$HOME/Videos/LIVE_wallpapers"
THUMB_DIR="$HOME/.cache/thumb_wallpapers"

mkdir -p "$THUMB_DIR"

find "$VIDEO_DIR" -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.mov" -o -iname "*.webm" \) | while read -r vid; do
    filename=$(basename "$vid")
    thumb_path="$THUMB_DIR/${filename}.png"
    
    if [ ! -f "$thumb_path" ]; then
        ffmpeg -ss 00:00:01 -i "$vid" -vframes 1 -q:v 2 -s 320x180 "$thumb_path" -y > /dev/null 2>&1
    fi
done


selected=$(find "$VIDEO_DIR" -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.mov" -o -iname "*.webm" \) | \
  while read -r vid; do
    filename=$(basename "$vid")
    thumb_path="$THUMB_DIR/${filename}.png"
    

    echo -e "$filename\x00icon\x1f$thumb_path"
  done | rofi -theme gruvbox-dark -dmenu -i \
    -p "󰈫 Live Wallpaper" \
    -theme-str 'window {width: 70%; height: 70%;}' \
    -theme-str 'listview {columns: 4; lines: 3;}' \
    -show-icons \
    -icon-theme "hicolor")


if [ -n "$selected" ]; then
    killall mpvpaper 2>/dev/null

    mpvpaper -o "loop" "*" "$VIDEO_DIR/$selected" &
fi
