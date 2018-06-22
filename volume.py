#!/bin/python3

# This script is used to increase/decrease the volume.

import subprocess
import sys

volume = sys.argv[1] + "%"

subprocess.run(["amixer", "sset", "Master", volume])
