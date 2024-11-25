#!/usr/bin/env bash

CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"

(cd $(dirname $0) ; wofi --conf "${CONFIG}" --style "${STYLE}" --show drun)
