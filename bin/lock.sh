#! /bin/bash

__lock() {
	gtklock
}

amount_of_outputs=$(swaymsg -t get_outputs | grep -i name | wc -l)

if [[ "$amount_of_outputs" == "1" ]]; then
	__lock
else
	swaymsg output eDP-1 disable
fi
