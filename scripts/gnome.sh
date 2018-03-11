#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh

# Install Gnome-Controll Center and Online Accounts for using Google Drive
installPackage gnome-control-center
installPackage gnome-online-accounts

# Install Gnome Tweak-Tool
installPackage gnome-tweak-tool