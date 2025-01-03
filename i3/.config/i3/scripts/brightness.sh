#!/bin/bash

# Get current brightness
BRIGHTNESS=$(xrandr --verbose | grep -m 1 'eDP connected' -A 7 | grep Brightness | awk '{print $2}')

# Increase or Decrease the brightness
if [ "$1" == "up" ]; then
  NEW_BRIGHTNESS=$(echo "$BRIGHTNESS + 0.1" | bc)
elif [ "$1" == "down" ]; then
  NEW_BRIGHTNESS=$(echo "$BRIGHTNESS - 0.1" | bc)
fi

# Apply new brightness
xrandr --output eDP --brightness $NEW_BRIGHTNESS

# Update the /tmp/.brightness file with the new brightness percentage
echo "$(awk "BEGIN {printf \"%.0f\", $NEW_BRIGHTNESS * 100}")%" >/tmp/.brightness
