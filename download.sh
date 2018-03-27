#!/bin/zsh

current_directory=$(pwd)

read url

if [ "$current_directory" = $HOME/Music ];
then
    youtube-dl "$url" -x --audio-format vorbis
else
    cd $HOME/Music && youtube-dl "$url" -x --audio-format vorbis
fi
