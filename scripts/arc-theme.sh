#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh

installPackage libgtk-3-dev
if ! [ -d ~/Documents/arc-theme ]; then
	echo -e "${LBLUE}installing arc-theme${NC}"
	cd ~/Documents/ && \
	git clone https://github.com/horst3180/arc-theme --depth 1 && \
	cd arc-theme && \
	./autogen.sh --prefix=/usr && \
	make install && \
	cd ~
fi