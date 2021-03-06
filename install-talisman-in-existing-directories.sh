#!/bin/bash
#This script is to install Talisman to existing git directories and it requires talisman to be installed as a git hook throughtout the machine and not just a single repo. You can verify by checking if #the install-talisman.sh is run and there's a pre-push hook in ~/.git-templates/hooks
echo "Please provide a command line arguement to the script to specify the absolute path of the repositiories, else the script will go to the home directory and install it there"
if [ -z "$1" ]
then
    echo "No arguement provided, going to the home directory and searching for git repo's there"
    cd
    array=($(ls -d */))
    #    echo ${array[@]}
    cd "$array"
    for i in "${array[@]}"
    do
	cd "$i"
	cp /home/vagrant/install-talisman.sh ./install-talisman.sh
	ls -a| grep ".git" && bash install-talisman.sh
	rm install-talisman.sh
	cd "/home/vagrant"
    done
fi

