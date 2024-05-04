#!/usr/bin/env bash

WOFI=$HOME/.config/wofi/wofi.sh

show_menu() {
	action=$(echo -e " Shutdown\n Reboot\n󰽥 Suspend\n Lock" | eval "$($WOFI list) -i --dmenu" | awk '{print tolower($2)}')
	case $action in
	lock)
		swaylock
		;;
	suspend)
		systemctl suspend
		;;
	reboot)
		systemctl reboot
		;;
	shutdown)
		systemctl poweroff -i
		;;
	esac
}

if [[ ! $(pidof wofi) ]]; then
	show_menu
else
	pkill wofi
fi
