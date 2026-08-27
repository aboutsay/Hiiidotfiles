#!/bin/bash
CURRENT_STATUS=$(hyprctl getoption decoration:blur:enabled | awk 'NR==1 {print $2}')


if [ "$CURRENT_STATUS" = "true" ]; then

    hyprctl eval 'hl.config({ decoration = { blur = { enabled = false } } })'
else

    hyprctl eval 'hl.config({ decoration = { blur = { enabled = true } } })'
fi
