#! /bin/bash

killall swayidle

cmd="$DOTFILES/bin/lock.sh"

afterResumeCmd="swaymsg seat seat0 cursor set 300 300"

swayidle before-sleep "$cmd" after-resume "$afterResumeCmd"
