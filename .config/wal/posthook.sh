#!/bin/bash

cp ~/.cache/wal/colors-scss.scss ~/.config/eww/colors.scss
cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/themes/colors-kitty.conf

swaync-client -rs
