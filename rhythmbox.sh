#!/bin/bash

if pgrep -x "rhythmbox" > /dev/null
then
    rhythmbox-client --print-playing-format="%at (%tn) - %tt - %te/%td"
else
	echo ""
fi
