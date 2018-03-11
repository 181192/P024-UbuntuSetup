#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/variables.sh

# Check if user is root
function isRoot {
	if [[ $(id -u) -ne 0 ]] ; 
   		then echo -e "${RED}Please run as root, try ${YELLOW}'sudo ./install.sh'${NC}" ;
   		exit 1 ; 
	fi
}

function installPackage {
	if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
		apt-get install $1 -y
	else
		echo -e "${GREEN}$1 already installed${NC}"
	fi
}

function installNpm {
	MODULES="/usr/local/lib/node_modules"

	if ! ls $MODULES | grep $1 > /dev/null 2>&1 ; then
		npm install -g $1
	else 
		echo -e "${GREEN}$1 already installed${NC}"
	fi
}

isRoot