#!/usr/bin/env bash

WOFI=$HOME/.config/wofi/wofi.sh

if [[ ! $(pidof wofi) ]]; then
	echo -e "$($WOFI table) --dmenu" | python3 $HOME/.config/hypr/scripts/hyprwins/main.py
else
	pkill wofi
fi
