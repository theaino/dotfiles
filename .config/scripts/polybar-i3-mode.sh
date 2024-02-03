#!/bin/bash
mode=$(cat "${HOME}/.config/i3/mode.txt")
if [ $mode = "resize" ] ; then
  printf "R"
else
  printf "D"
fi
