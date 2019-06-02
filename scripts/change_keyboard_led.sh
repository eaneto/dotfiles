#!/bin/sh

# This file controls the keyboard led.

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root"
	exit 1
fi

LED=/sys/devices/platform/dell-laptop/leds/dell::kbd_backlight/brightness

sed 's/'"$1"'/'"$2"'/g' $LED > $LED
