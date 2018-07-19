#!/bin/bash

current_directory=$(pwd)

if [ "$current_directory" = $HOME/Music ];
then
    youtube-dl "$1" -x --audio-format vorbis
else
    cd $HOME/Music && youtube-dl "$1" -x --audio-format vorbis
fi
