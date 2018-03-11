#!/bin/bash

. $DIR/functions/functions.sh

docker-machine --version >> /dev/null
if [ $? -ne 0 ]; then
    curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && \
	install /tmp/docker-machine /usr/local/bin/docker-machine
else
    echo -e "${GREEN}docker-machine already installed ${CYAN}($(docker-machine --version))${NC}"
fi