#!/bin/bash

cd $(dirname $0)

wall_path=$(realpath "$(dirname "$(realpath $0)")/../wallpapers")

wallpaper="$(find -L $wall_path -type f | shuf -n 1)"

./change.sh "$wallpaper"

echo "$wallpaper" > lastwall

python3 -m pywal -i "$wallpaper"
python3 -m pywal -R -o $HOME/.config/wal/posthook.sh
