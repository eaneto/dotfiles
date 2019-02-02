#!/usr/bin/bash

project_lang=$1
project_name=$2

help_message() {
    echo -e "Create sample project script.\n"
    echo -e "Usage: init-project [PROJECT_LANG] [PROJECT_NAME]\n"
    echo -e "Written by Edison Neto"
}

create_java_project() {
    mkdir -p "$project_name"/src/main/java/"$project_name"
	cd "$project_name"
    cp $SCRIPTS/java/base-pom.xml pom.xml
}

create_javascript_project() {
	mkdir "$project_name"
    cd "$project_name"
	npm init
}

create_python_project() {
	mkdir "$project_name"
    cd "$project_name"
	virtualenv .venv
}

create_c_project() {
    mkdir "$project_name"
    cd "$project_name"
}

if [ $# != 2 ];
then
    help_message;
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
	create_python_project;
elif [ "$project_lang" = "c" ] || [ "$project_lang" = "c++" ];
then
	create_c_project
elif [ "$project_lang" = "javascript" ];
then
    create_javascript_project;
elif [ "$project_lang" = "java" ];
then
    create_java_project;
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
