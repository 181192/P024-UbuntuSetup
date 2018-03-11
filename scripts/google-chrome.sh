#!/bin/bash

. $DIR/functions/functions.sh

google-chrome --version >> /dev/null
if [ $? -ne 0 ]; then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
	sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
	apt update && \
	apt install google-chrome-stable -y
else
    echo -e "${GREEN}google-chrome already installed ${CYAN}($(google-chrome --version))${NC}"
fi