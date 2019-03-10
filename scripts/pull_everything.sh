#!/usr/bin/env bash

PROJECTS_DIR=~/projects/*
RED='\033[0;31m'
ERASE='\033[0m'

for directory in $PROJECTS_DIR
do
    is_dir=$(file $directory | grep directory | wc -l)
    if [ is_dir != 0 ];
    then
        cd $directory
        is_repo=$(git status | grep -i "branch" | wc -l)
        if [ $is_repo != 0 ];
        then
            echo -e "\n$RED ${PWD##*/} $ERASE\n"
            git status && git pull
        fi
    fi
done
