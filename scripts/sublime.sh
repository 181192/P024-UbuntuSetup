#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh

subl --version >> /dev/null
if [ $? -ne 0 ]; then
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && \
	sudo apt-get install apt-transport-https && \
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list && \
	sudo apt-get update && \
	sudo apt-get install sublime-text && \
	subl
else
    echo -e "${GREEN}sublime-text already installed ${CYAN}($(subl --version))${NC}"
fi