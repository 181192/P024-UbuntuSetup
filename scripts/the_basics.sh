#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh


# Installing some common basic packages.
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
installPackage net-tools
installPackage terminator
installPackage indicator-multiload