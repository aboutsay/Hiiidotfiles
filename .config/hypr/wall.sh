#!/bin/bash


DIR="$HOME/Pictures/wallpapers"


WALLPAPER=$(find "$DIR" -type f | shuf -n 1)


#TYPES=("wipe" "outer" "random" "wave" "grow" "center" "any")
#TYPES=("grow")
#TRANSITION=${TYPES[$RANDOM % ${#TYPES[@]}]}

# run
awww img "$WALLPAPER" --transition-type any --transition-step 255 --transition-fps 24 --transition-duration 0.7
