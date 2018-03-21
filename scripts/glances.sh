#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh

# Install Glances
installPackage glances
. $DIR/scripts/python2.sh
pip install --upgrade glances