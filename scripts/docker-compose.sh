#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh

docker-compose --version >> /dev/null
if [ $? -ne 0 ]; then
	sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
else
    echo -e "${GREEN}docker-compose already installed ${CYAN}($(docker-compose --version))${NC}"
fi