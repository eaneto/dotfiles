#!/bin/bash

current_directory=$(pwd)

if [ "$current_directory" = $HOME/Projects/siano ] ||
   [ "$current_directory" = $HOME/Projects/siano/siano ] ||
   [ "$current_directory" = $HOME/Projects/siano/siano/* ];
then
    echo "Securing password ..."
    sh $HOME/Projects/siano/remove_passwords.sh safe
    echo "$1"
    git add "$1"
else
    echo "$1"
    git add "$1"
fi
