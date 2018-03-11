#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh

# Install Deluge
installPackage deluge