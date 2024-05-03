#!/usr/bin/env bash

CONFIG="$HOME/.config/wofi/config/config"
STYLE="$HOME/.config/wofi/src/mocha/style.css"

show_menu() {
	action=$(echo -e " Shutdown\n Reboot\n󰽥 Suspend\n Lock" | wofi --conf "${CONFIG}" --style "${STYLE}" -i --dmenu | awk '{print tolower($2)}')
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
