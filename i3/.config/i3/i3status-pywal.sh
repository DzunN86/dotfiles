#!/bin/bash

# Source the pywal colors
source "$HOME/.cache/wal/colors.sh"

# Execute i3status with your config
exec i3status -c "$HOME/.config/i3/i3status.conf"
