#!/bin/bash
#This script will change all the pre-push hooks in talisman to pre-commit hooks

cd
array=($(ls -d */))
cd "$array"
for i in "${array[@]}"
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
    cd
done
