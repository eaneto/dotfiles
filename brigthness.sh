#!/bin/zsh

# This script helps me change the brigthness of my computer screen.

echo "Select:"
echo "----------------------"
echo "|1| Night mode"
echo "|2| Not so bright mode"
echo "|3| Bright mode"
echo "|4| Too bright mode"
echo "|5| I can't see mode"
echo "----------------------"

read option

if [ "$option" -eq 1 ]
then
	xbacklight -set 10
elif [ "$option" -eq 2 ]
then
	xbacklight -set 25
elif [ "$option" -eq 3 ]
then
	xbacklight -set 50
elif [ "$option" -eq 4 ]
then
	xbacklight -set 75
elif [ "$option" -eq 5 ]
then
	xbacklight -set 100
fi

echo "Brightness set to: "
xbacklight -get
