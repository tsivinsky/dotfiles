#! /bin/bash

# Terminate already running bar instances
killall -q polybar

polybar main -c $HOME/.config/polybar/config.ini

echo "Bars launched..."

