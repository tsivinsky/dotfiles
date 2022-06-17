#! /bin/bash

pactl list sources | grep -qi "Mute: yes"
state="$?"

if [[ "$state" == "0" ]]; then
	echo "1" >/sys/devices/platform/huawei-wmi/leds/platform::micmute/brightness
else
	echo "0" >/sys/devices/platform/huawei-wmi/leds/platform::micmute/brightness
fi
