#!/bin/bash

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

SOUND_PATH="/usr/share/sounds/freedesktop/stereo/complete.oga"

BATTERY_PATH=$(command ls /sys/class/power_supply/ | grep -E '^BAT' | head -n 1)

if [ -z "$BATTERY_PATH" ]; then
    exit 0
fi

CAPACITY=$(cat /sys/class/power_supply/$BATTERY_PATH/capacity)
STATUS=$(cat /sys/class/power_supply/$BATTERY_PATH/status)

if [ "$STATUS" = "Charging" ]; then
    exit 0
fi

if [ "$CAPACITY" -le 15 ]; then
    pw-play $SOUND_PATH &
    notify-send -u critical "           HELLO ?" "ma lord !! $CAPACITY% LEFT"
elif [ "$CAPACITY" -le 20 ]; then
    pw-play $SOUND_PATH &
    notify-send -u critical "       THE BATTERY :>" "ma lord !! we have $CAPACITY% LEFT! If you don't plug me in"
fi