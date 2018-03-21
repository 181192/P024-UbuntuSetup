#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh

# Install Python3
installPackage python3-pip
installPackage build-essential
installPackage libssl-dev
installPackage libffi-dev
installPackage python-dev
pip3 install numpy