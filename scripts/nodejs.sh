#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh

# Install nodejs
if [ $(dpkg-query -W -f='${Status}' nodejs 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
	curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && \
	apt-get install -y nodejs
else
	echo -e "${GREEN}nodejs already installed ${CYAN}($(nodejs --version))${NC}"
fi