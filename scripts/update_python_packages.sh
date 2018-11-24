#!/usr/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root"
	exit 1
fi

# update all python3 packages.
python3 -m pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 python3 -m pip install -U

echo "Everything updated"
