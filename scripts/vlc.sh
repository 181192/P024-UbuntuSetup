#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh

# Install VLC
installPackage vlc
installPackage browser-plugin-vlc