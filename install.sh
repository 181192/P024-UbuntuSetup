#!/bin/bash
#title           :install.sh
#description     :This script will install everything you need
#author		 :Kristoffer-Andre Kalliainen <k@kalli.no>
#date            :201803011
#version         :1.3.0
#=============================================================================
DIR="$(dirname "$0")"
. $DIR/functions/variables.sh
. $DIR/functions/functions.sh

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
installPackage ufw
installPackage unrar
installPackage tree
installPackage lm-sensors
installPackage build-essential
installPackage tar


. $DIR/scripts/arc-theme.sh
. $DIR/scripts/deluge.sh
. $DIR/scripts/docker.sh
. $DIR/scripts/docker-compose.sh
. $DIR/scripts/docker-machine.sh
. $DIR/scripts/gimp.sh
. $DIR/scripts/glances.sh
. $DIR/scripts/gnome.sh
. $DIR/scripts/google-chrome.sh
. $DIR/scripts/java.sh
. $DIR/scripts/jetbrains-toolbox.sh
. $DIR/scripts/mongodb.sh
. $DIR/scripts/nodejs.sh
. $DIR/scripts/nginx.sh
. $DIR/scripts/openvpn.sh
. $DIR/scripts/sublime.sh
. $DIR/scripts/virtualbox.sh
. $DIR/scripts/vlc.sh

# Install some npm packages
. $DIR/scripts/node_modules.sh

# Update all packages and install updates
. $DIR/scripts/update_upgrade.sh

# Comment to developer
echo -e "\n\n\n${YELLOW}Done!${NC}\n\n"

exit 0;