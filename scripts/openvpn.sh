#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/functions.sh

# Install OpenVPN with NordVPN configs
installPackage openvpn
installPackage ca-certificates
installPackage unzip

if [ -f /etc/openvpn/ovpn.zip ]; then
	rm /etc/openvpn/ovpn.zip
fi

if [ ! -d /etc/openvpn/ovpn_tcp ] || [ ! -d /etc/openvpn/ovpn_udp ]; then
	wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip /etc/openvpn && \
	unzip /etc/openvpn/ovpn.zip && \
	rm /etc/openvpn/ovpn.zip
fi