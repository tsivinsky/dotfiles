#! /bin/bash

__lock() {
	gtklock -d
}

if [[ "$1" == "just-lock" ]]; then
	__lock
	exit
fi

amount_of_outputs=$(swaymsg -t get_outputs | grep -i name | wc -l)

swaymsg output eDP-1 disable

if [[ "$amount_of_outputs" == "1" ]]; then
	playerctl pause
	__lock
fi
