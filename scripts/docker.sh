#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh

docker --version >> /dev/null
if [ $? -ne 0 ]; then
	curl -fsSL get.docker.com -o get-docker.sh
	sh get-docker.sh
	usermod -aG docker $(whoami)
	docker run hello-world
else
    echo -e "${GREEN}docker already installed ${CYAN}($(docker --version))${NC}"
fi