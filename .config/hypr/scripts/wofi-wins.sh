#!/usr/bin/env bash

CONFIG="$HOME/.config/wofi/config/config"
STYLE="$HOME/.config/wofi/src/mocha/style.css"

if [[ ! $(pidof wofi) ]]; then
	echo -e "wofi --conf \"${CONFIG}\" --style \"${STYLE}\" --dmenu" | python3 $HOME/.config/hypr/scripts/hyprwins/main.py
else
	pkill wofi
fi
