#!/bin/bash

. $DIR/functions/functions.sh

# Install jetbrains-toolbox
if [ -f jetbrains-toolbox-1.7.3593.tar.gz ]; then
	rm jetbrains-toolbox-1.7.3593.tar.gz
fi

if [ -d jetbrains-toolbox-1.7.3593 ]; then
	rm -rf jetbrains-toolbox-1.7.3593
fi

if [ -d ~/.local/share/JetBrains/Toolbox ]; then
	echo -e "${GREEN}jetbrains-toolbox already installed${NC}"	
else	
	wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.7.3593.tar.gz && \
	tar -xvzf jetbrains-toolbox-1.7.3593.tar.gz && \
	mkdir /opt/jetbrains-toolbox && \
	mv jetbrains-toolbox-1.7.3593/jetbrains-toolbox /opt/jetbrains-toolbox/ && \
	rm -rf jetbrains-toolbox-1.7.3593/ jetbrains-toolbox-1.7.3593.tar.gz && \
	cd /opt/jetbrains-toolbox/ && \
	./jetbrains-toolbox && \
	cd ~
fi