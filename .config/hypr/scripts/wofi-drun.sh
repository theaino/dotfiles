#!/usr/bin/env bash

WOFI=$HOME/.config/wofi/wofi.sh

if [[ ! $(pidof wofi) ]]; then
	eval "$($WOFI list) --show drun"
	#wofi --conf "${CONFIG}" --style "${STYLE}" --show drun
else
	pkill wofi
fi
