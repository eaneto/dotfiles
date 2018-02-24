#!/bin/zsh

# This script is used to increase/decrease the volume.

if [ "$1" ]
then
    amixer sset 'Master' $1%
fi
