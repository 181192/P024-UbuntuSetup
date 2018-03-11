#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh

# Install Java 8 Oracle version
installPackage openjdk-9-jre-headless
java --version >> /dev/null
if [ $? -eq 0 ]; then
	echo 'JAVA_HOME="/usr/lib/jvm/java-9-openjdk-amd64/bin/java"' >> /etc/environment
	source /etc/environment
fi