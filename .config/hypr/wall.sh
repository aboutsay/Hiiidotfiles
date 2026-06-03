#!/bin/bash

# مسار مجلد الخلفيات - تأكد إن المسار صح!
DIR="$HOME/Pictures/wallpapers"

# اختيار خلفية عشوائية
WALLPAPER=$(find "$DIR" -type f | shuf -n 1)

# أنواع الـ transitions عشان نختار واحد عشوائي كل مرة
#TYPES=("wipe" "outer" "random" "wave" "grow" "center" "any")
TYPES=("grow")
TRANSITION=${TYPES[$RANDOM % ${#TYPES[@]}]}

# تنفيذ الأمر
awww img "$WALLPAPER" --transition-type "$TRANSITION" --transition-step 255 --transition-fps 24
