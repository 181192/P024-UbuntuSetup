#!/bin/bash
#title           :install.sh
#description     :This script will install everything you need
#author		 :Kristoffer-Andre Kalliainen <k@kalli.no>
#date            :201803011
#version         :1.3.0
#=============================================================================


GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
LBLUE='\033[1;34m'
NC='\033[0m' # No Color

# Check if user is root
if [[ $(id -u) -ne 0 ]] ; 
   then echo -e "${RED}Please run as root, try ${YELLOW}'sudo ./install.sh'${NC}" ;
   exit 1 ; 
fi

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

# Grab some command line basics
installPackage wget
installPackage rsync
installPackage git
installPackage nano
installPackage gcc
installPackage automake
installPackage autoconf
installPackage libtool
installPackage make
installPackage npm

# Install Gnome-Controll Center and Online Accounts for using Google Drive
installPackage gnome-control-center
installPackage gnome-online-accounts

# Install Gnome Tweak-Tool
installPackage gnome-tweak-tool

# Install nginx
installPackage nginx

# Install mongodb
installPackage mongodb-server
installPackage mongodb

# Install Java 8 Oracle version
installPackage openjdk-9-jre-headless
java --version >> /dev/null
if [ $? -eq 0 ]; then
	echo 'JAVA_HOME="/usr/lib/jvm/java-9-openjdk-amd64/bin/java"' >> /etc/environment
	source /etc/environment
fi

# Install VirtualBox
installPackage virtualbox
installPackage virtualbox-ext-pack

# Install UFW - Uncomplicated Firewall
installPackage ufw

# Install Unrar
installPackage unrar

# Install Glances
installPackage glances

# Install VLC
installPackage vlc
installPackage browser-plugin-vlc

# Install GIMP
installPackage gimp

# Install Deluge
installPackage deluge

# Install OpenVPN with NordVPN configs
installPackage openvpn
installPackage ca-certificates
installPackage unzip

cd /etc/openvpn

if [ -f ovpn.zip ]; then
	rm ovpn.zip
fi

if [ ! -d /etc/openvpn/ovpn_tcp ] || [ ! -d /etc/openvpn/ovpn_udp ]; then
	wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip && \
	unzip ovpn.zip && \
	rm ovpn.zip
fi

# Return to home directory
cd ~

# Install nodejs
if [ $(dpkg-query -W -f='${Status}' nodejs 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
	curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && \
	apt-get install -y nodejs
else
	echo -e "${GREEN}nodejs already installed ${CYAN}($(nodejs --version))${NC}"
fi

# Install docker, docker-compose, docker-machine
docker --version >> /dev/null
if [ $? -ne 0 ]; then
	curl -fsSL get.docker.com -o get-docker.sh
	sh get-docker.sh
	usermod -aG docker $(whoami)
	docker run hello-world
else
    echo -e "${GREEN}docker already installed ${CYAN}($(docker --version))${NC}"
fi

docker-compose --version >> /dev/null
if [ $? -ne 0 ]; then
	sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
else
    echo -e "${GREEN}docker-compose already installed ${CYAN}($(docker-compose --version))${NC}"
fi

docker-machine --version >> /dev/null
if [ $? -ne 0 ]; then
    curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && \
	install /tmp/docker-machine /usr/local/bin/docker-machine
else
    echo -e "${GREEN}docker-machine already installed ${CYAN}($(docker-machine --version))${NC}"
fi

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

# Install Sublime Text 3
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

# Install Google Chrome
google-chrome --version >> /dev/null
if [ $? -ne 0 ]; then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
	sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
	apt update && \
	apt install google-chrome-stable -y
else
    echo -e "${GREEN}google-chrome already installed ${CYAN}($(google-chrome --version))${NC}"
fi

# Install Arc Theme
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

# Allow non-root users to run command line applications installed with
# "npm install -g", otherwise it is not very useful
chmod -R a+r /usr/local/lib/node_modules/

# Some npm usefull packages
installNpm express
installNpm react
installNpm uglify-js
installNpm browserify
installNpm webpack

if ! [ -d /usr/local/lib/node_modules/@angular/cli ]; then
	installNpm @angular/cli
fi

installNpm angular

# Update all packages and install updates
echo -e "\n${PURPLE}Updating all packages and clean up${NC}"
{
	apt-get update && apt-get upgrade -y && apt-get autoremove -y && apt-get clean
} > /dev/null

# Comment to developer
echo -e "\n\n\n${YELLOW}Done!${NC}\n\n"

exit 0;