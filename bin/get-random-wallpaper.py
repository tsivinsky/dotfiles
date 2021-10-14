#! /usr/bin/env python3

import os
import glob
import random

homedir = os.environ['HOME']

wallpapers = glob.glob(f"{homedir}/Pictures/Wallpapers/*")

while True:
    wallpaper = random.choice(wallpapers)

    if wallpaper.__contains__("README.md"):
        continue
    else:
        break

print(wallpaper)

