#! /bin/bash

state=$(pactl get-source-mute $(pactl get-default-source) | awk '{printf $2}')

result='{"text": "", "alt": "'
result+="$state\"}"

echo "$result"
