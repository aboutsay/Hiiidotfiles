#!/bin/bash

# I EDITED THE FIRST ONE TO MAKE LIVE WALLPAPERS FOR YOU (I TAKES 3 HOURS FOR THAT ToT)
DIR="/home/owen2/Videos/LIVE_wallpapers"

WALLPAPER=$(find "$DIR" -type f | shuf -n 1)


#TYPES=("wipe" "outer" "random" "wave" "grow" "center" "any")
#TYPES=("grow")
#TRANSITION=${TYPES[$RANDOM % ${#TYPES[@]}]}


pkill mpvpaper
mpvpaper -o "--loop --video-sync=desync --speed=1 --vf=fps=24" '*' "${WALLPAPER[$RANDOM % ${#WALLPAPER[@]}]}"
