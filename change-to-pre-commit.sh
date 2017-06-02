#!/bin/bash
#This script will change all the pre-push hooks in talisman to pre-commit hooks

cd "$1"
LIST_OF_DIRECTORIES=($(ls -d */))
cd "$LIST_OF_DIRECTORIES"
for i in "${LIST_OF_DIRECTORIES[@]}"
do
    cd "$i"
    FLAG=$(ls -a | grep -w ".git")
    if [ "$FLAG" == ".git" ]
    then
	mv pre-push pre-commit-talisman
	touch pre-commit
	echo ".git/hooks/pre-commit-talisman -githook=pre-commit" > pre-commit
	chmod +x pre-commit
    fi
    cd "$1"
done
