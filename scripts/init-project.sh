#!/usr/bin/bash

project_lang=$1
project_name=$2

if [ $# != 2 ];
then
    echo "Not enough arguments"
    exit 1
fi

echo -e "Creating project $project_name... \n"
sleep .5

if [ -d "$project_name" ];
then
	echo "Directory '$project_name' already exists."
	exit 1
fi

if [ "$project_lang" = "python" ];
then
	mkdir "$project_name" && cd "$project_name"
	virtualenv .venv
elif [ "$project_lang" = "c" ];
then
	mkdir "$project_name" && cd "$project_name"
elif [ "$project_lang" = "javascript" ];
then
	mkdir "$project_name" && cd "$project_name"
	npm init
elif [ "$project_lang" = "java" ];
then
	mvn archetype:generate -DgroupId=com."$project_name".app \
		-DartifactId="$project_name" \
		-DarchetypeArtifactId=maven-archetype-quickstart \
		-DinteractiveMode=false
	cd "$project_name"
fi

git init
cp $HOME/Projects/scripts-and-config/scripts/emacs/"$project_lang".dumbjump ./.dumbjump

read -e -p "Is there a github repo? [y/n]" github

if [ "$github" = "y" ];
then
	git remote add origin https://github.com/3ldr0n/"$project_name".git
	git remote -v
	git pull origin master
fi


echo -e "\nProject created and ready to work."
