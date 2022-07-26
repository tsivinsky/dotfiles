#! /bin/bash

killall swayidle

lockCmd="$HOME/dotfiles/bin/lock.sh just-lock"

swayidle -w \
	timeout 900 "$lockCmd" \
	timeout 900 'swaymsg "output * dpms off"' \
	resume 'swaymsg "output * dpms on"' \
	before-sleep "$lockCmd"
