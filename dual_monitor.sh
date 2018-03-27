#!/bin/zsh

monitor=$(xrandr | grep -w "connected" | wc -l)

if [ $monitor = 2  ];
then
    xrandr --output HDMI1 --right-of eDP1 --auto    
fi
