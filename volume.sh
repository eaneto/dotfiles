#!/usr/bin/bash

# This script is used to increase/decrease the volume.

if [ "$1" ];
then
	volume="$1%"
	amixer sset Master "$volume"
else
	amixer sget Master
fi
