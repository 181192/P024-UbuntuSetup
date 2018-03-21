#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh

# Install Java 8 Oracle version
installPackage openjdk-9-jre-headless
java --version >> /dev/null
if [ $? -eq 0 ]; then
	# Java paths, will be added to the end of file
	# TODO must check if the paths already exists
	echo "export JAVA_HOME=/usr/lib/jvm/java-9-openjdk-amd64" >> ~/.bashrc         
	echo "export PATH=${PATH}:$JAVA_HOME/bin" >> ~/.bashrc
	source ~/.bashrc
fi