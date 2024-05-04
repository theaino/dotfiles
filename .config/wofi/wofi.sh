#!/usr/bin/env bash

CONFIG="$HOME/.config/wofi/$1/config"
STYLE="$HOME/.config/wofi/$1/style.css"

printf "wofi --conf \"${CONFIG}\" --style \"${STYLE}\""
