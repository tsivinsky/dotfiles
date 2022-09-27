#! /bin/bash

__set_image() {
	swww img "$1" --transition-fps 60
}

if [[ "$1" == "--restore" ]]; then
	image=$(cat ~/.config/.wallpaper)
	__set_image "$image"
	exit
fi

image="$1"

__set_image "$image"

full_path="$PWD/$image"
echo "$full_path" >~/.config/.wallpaper
