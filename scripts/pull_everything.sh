#!/usr/bin/bash

PROJECTS_DIR=/home/eldron/Projects/*

for directory in $PROJECTS_DIR
do
    is_dir=$(file $directory | grep directory | wc -l)
    if [ is_dir != 0 ];
    then
        cd $directory
        is_repo=$(git status | grep -i "branch" | wc -l)
        if [ $is_repo != 0 ];
        then
            echo "$directory"
            git status && git pull
        fi
    fi
done
