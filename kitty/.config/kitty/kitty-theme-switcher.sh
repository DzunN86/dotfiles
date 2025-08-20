#!/bin/bash

KITTY_DIR="$HOME/.config/kitty"
THEME_DIR="$KITTY_DIR/themes"
CURRENT_THEME_LINK="$KITTY_DIR/current-theme.conf"

# Check if fzf is installed
if ! command -v fzf &>/dev/null; then
  echo "fzf not found! Please install fzf to use this script."
  exit 1
fi

# Let user pick theme using fzf
selected=$(ls "$THEME_DIR"/*.conf | xargs -n1 basename | fzf --prompt="Kitty Theme > " --height=40%)

# If a theme was selected
if [[ -n "$selected" ]]; then
  theme_path="$THEME_DIR/$selected"
  ln -sf "$theme_path" "$CURRENT_THEME_LINK"
  echo "✅ Switched to: $selected"

  # Optional: live reload (if using kitty remote control)
  kitty @ set-colors --all --configured "$theme_path" 2>/dev/null ||
    echo "ℹ️ Restart Kitty to apply the new theme."
else
  echo "No theme selected."
fi
