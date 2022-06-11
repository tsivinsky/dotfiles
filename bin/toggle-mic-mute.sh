#! /bin/bash

pactl list sources | grep -qi 'Mute: yes'
state="$?"

id="991050"
appName="microphone-is-muted"

if [[ "$state" == "0" ]]; then
	# mic is muted
	pactl set-source-mute @DEFAULT_SOURCE@ 0
	dunstify -a "$appName" -u low -t 1000 -r "$id" "Actived microphone" "It's not muted now"
else
	# mic is not muted
	pactl set-source-mute @DEFAULT_SOURCE@ 1
	dunstify -a "$appName" -u low -t 1000 -r "$id" "Disabled microphone" "It's muted now"
fi
