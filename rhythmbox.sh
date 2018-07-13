#!/bin/bash

is_opened=$(ps -ef | grep rhythmbox | wc -l)
if [ "$is_opened" -ne 0 ];
then
    rhythmbox-client --print-playing-format="%tt - %te/%td"
else
    echo "No song"
fi
