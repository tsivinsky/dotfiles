#! /bin/bash

color=$(hyprpicker)

wl-copy "$color"

status="$?"
if [[ "$status" == "0" ]]; then
	notify-send "Color copied to clipboard" "$color"
else
	notify-send "Some error happened while copying color"
fi
