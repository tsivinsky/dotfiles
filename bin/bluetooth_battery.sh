#! /bin/bash

name="$1"

model_line=$(upower -d | grep -n "$name" | cut -d ':' -f 1)
if [[ "$model_line" == "" ]]; then
	exit 1
fi

idx=$(($model_line - 2))
id=$(upower -d | sed "$idx!d" | awk '{print $2}')

percentage=$(upower -i "$id" | grep "percentage: " | awk '{print $2}')

echo "$percentage"
