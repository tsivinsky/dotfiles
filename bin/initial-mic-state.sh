#! /bin/bash

pactl list sources | grep -qi "Mute: yes"
state="$?"

if [[ "$state" == "0" ]]; then
	brightnessctl -d "platform::micmute" s 1
else
	brightnessctl -d "platform::micmute" s 0
fi
