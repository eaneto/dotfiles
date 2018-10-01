#!/bin/bash

# This script is used to increase/decrease the volume.

volume="$1%"
amixer sset Master "$volume"
