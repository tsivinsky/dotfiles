#! /bin/bash

updates=$(pacman -Qu | wc -l)

echo $updates
