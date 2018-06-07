#!/bin/bash

# This file controls the keyboard led.
# TODO make a script to turn it on/off.

cat /sys/devices/platform/dell-laptop/leds/dell::kbd_backlight/brightness
