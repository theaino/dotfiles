#!/bin/bash
time=$(date +"%m-%d-%y_%H:%M")
path="${HOME}/Pictures/Screenshot_${time}.png"
echo $path
maim --select $path
if [ $? -eq 0 ] ; then
  xclip -selection clipboard -t image/png -i $path
fi
