#! /bin/bash

output="eDP-1"

if grep -q open /proc/acpi/button/lid/LID/state; then
	swaymsg output $output enable
else
	swaymsg output $output disable
fi
