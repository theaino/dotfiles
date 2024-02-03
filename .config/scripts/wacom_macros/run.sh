#!/bin/bash

path=$HOME/.config/scripts/wacom_macros/daemon.py

pid=$(pgrep -f $path)
if [ $pid ] ; then
  echo Killing running process $pid
  kill $pid
fi
echo Running $path
python3 $path
