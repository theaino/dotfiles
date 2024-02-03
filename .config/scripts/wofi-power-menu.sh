#!/bin/bash

entries="Logout\nSuspend\nReboot\nShutdown"

selected=$(echo -e $entries | wofi -i --dmenu | awk '{print tolower($0)}')

case $selected in
  logout)
    hyprctl dispatch exit;;
  suspend)
    systemctl suspend;;
  reboot)
    systemctl reboot;;
  shutdown)
    systemctl poweroff -i;;
esac
