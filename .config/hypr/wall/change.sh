#!/bin/bash

while
	hyprctl hyprpaper
  [[ $? -ne 0 ]]
do true; done

hyprctl hyprpaper preload $1


monitors=$(hyprctl monitors -j)
echo $monitors | jq -c '.[]' | while read i; do
	name=$(echo $i | jq -c '.name' | tr -d '"')
	arg="$name,$1"
	(hyprctl hyprpaper wallpaper "$arg")
done
