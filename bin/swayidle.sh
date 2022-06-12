#! /bin/bash

killall swayidle

cmd="swaylock"

swayidle before-sleep $cmd
