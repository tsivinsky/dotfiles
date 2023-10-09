#! /bin/bash

active_output=$(swaymsg -p -t get_outputs | grep '(focused)' | awk '{ printf $2 }')

device=""
if [[ "$active_output" == "HDMI-A-1" ]]; then
	device="ddcci5"
else
	device="amdgpu_bl1"
fi

param=""
if [[ "$1" == "up" ]]; then
	param="+"
else
	param="-"
fi

brightnessctl -d "$device" set 5%$param
