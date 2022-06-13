#! /bin/bash

readonly WMI=/sys/devices/platform/huawei-wmi

chmod g+w "$WMI/leds/platform::micmute/brightness"
chown root:huawei-wmi "$WMI/leds/platform::micmute/brightness"
