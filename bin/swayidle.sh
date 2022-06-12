#! /bin/bash

killall swayidle

cmd="swaylock"

swayidle before-sleep $cmd after-resume "swaymsg seat seat0 cursor set 300 300"
