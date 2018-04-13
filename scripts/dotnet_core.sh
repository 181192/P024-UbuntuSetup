#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh


# Packages required for dotnet core
# https://docs.microsoft.com/en-us/dotnet/core/linux-prerequisites?tabs=netcore2x
installPackage libunwind8
installPackage liblttng-ust0
installPackage libcurl3
installPackage libssl1.0.0
installPackage libuuid1
installPackage libkrb5-3
installPackage zlib1g
installPackage libicu57


# Install guide from Microsoft
# https://www.microsoft.com/net/learn/get-started/linux/ubuntu17-10
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-artful-prod artful main" > /etc/apt/sources.list.d/dotnetdev.list'


installPackage apt-transport-https
installPackage apt-transport-https
installPackage dotnet-sdk-2.1.104