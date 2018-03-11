#!/bin/bash
#title           :install.sh
#description     :This script will install everything you need
#author		 :Kristoffer-Andre Kalliainen <k@kalli.no>
#date            :201803011
#version         :1.3.0
#=============================================================================


GREEN='\033[0;32m'
CYAN='\033[0;31m'
NC='\033[0m' # No Color

# Check if user is root
if [[ $(id -u) -ne 0 ]] ; 
   then echo -e "${CYAN}Please run as root, try 'sudo ./install.sh'${NC}" ;
   exit 1 ; 
fi

function installPackage {
	if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ];
	then
		apt-get install $1 -y
	else
		echo -e "${GREEN}$1 already installed${NC}"
	fi
}

function installNpm {
	MODULES="/usr/local/lib/node_modules"

	if ! ls $MODULES | grep $1 > /dev/null 2>&1
	then
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

# Install OpenVPN with NordVPN configs
installPackage openvpn
installPackage ca-certificates
installPackage unzip

cd /etc/openvpn

if [ -f ovpn.zip ]
then
	rm ovpn.zip
fi

wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip && \
unzip ovpn.zip && \
rm ovpn.zip

# Install node, imagemagick, npm, and compiler tools so an efficient
# mongo driver can be compiled by npm
if [ $(dpkg-query -W -f='${Status}' nodejs 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && \
	apt-get install -y nodejs
else
	echo -e "${GREEN}nodejs already installed${NC}"
fi

# Install docker, docker-compose, docker-machine
if [ -x "$(command -v docker)" ]; then
    echo "${GREEN}docker already installed${NC}"
else
    curl -sSL https://get.docker.com | sh
fi

if [ -x "$(command -v docker-compose)" ]; then
    echo "${GREEN}docker-compose already installed${NC}"
else
    echo "Install docker"
    curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
	chmod +x /usr/local/bin/docker-compose
fi

if [ -x "$(command -v docker-machine)" ]; then
    echo "${GREEN}docker-machine already installed${NC}"
else
    curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && \
	install /tmp/docker-machine /usr/local/bin/docker-machine
fi

# Install Deluge
if [ $(dpkg-query -W -f='${Status}' deluge 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	add-apt-repository ppa:deluge-team/ppa
	apt-get update
	apt-get install deluge -y
else
	echo "${GREEN}deluge already installed${NC}"
fi

# Install jetbrains-toolbox
if [ -f jetbrains-toolbox-1.7.3593.tar.gz ]
then
	rm jetbrains-toolbox-1.7.3593.tar.gz
fi

if [ -d jetbrains-toolbox-1.7.3593 ]
then
	rm -rf jetbrains-toolbox-1.7.3593
fi

wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.7.3593.tar.gz && \
tar -xvzf jetbrains-toolbox-1.7.3593.tar.gz && \
mkdir /opt/jetbrains-toolbox && \
mv jetbrains-toolbox-1.7.3593/jetbrains-toolbox /opt/jetbrains-toolbox/ && \
rm -rf jetbrains-toolbox-1.7.3593/ jetbrains-toolbox-1.7.3593.tar.gz && \
cd /opt/jetbrains-toolbox/ && \
./jetbrains-toolbox

# Install Sublime Text 3
add-apt-repository ppa:webupd8team/sublime-text-3 && \
apt-get update && \
apt-get install sublime-text-installer -y && \
subl

# Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
apt update && \
apt install google-chrome-stable -y

# Install Arc Theme
cd ~/Dockuments/ && \
git clone https://github.com/horst3180/arc-theme --depth 1 && \
cd arc-theme && \
./autogen.sh --prefix=/usr && \
make install && \
gsettings set org.gnome.shell.extensions.user-theme name "Arc-Dark"

# Update all packages and install updates
apt update && apt upgrade -y && apt autoremove -y && apt clean

# Allow non-root users to run command line applications installed with
# "npm install -g", otherwise it is not very useful
chmod -R a+r /usr/lib/node_modules/

# Some npm usefull packages
installNpm express
installNpm react
installNpm uglify-js
installNpm browserify
installNpm webpack
installNpm @angular/cli
installNpm @angular

# Comment to developer
echo -e "\n\n\nDone!\n\n"

echo -e "To set JAVA_HOME variable, paste ${update-alternatives --config java} \n at the end of the line in /etc/enviroment"
