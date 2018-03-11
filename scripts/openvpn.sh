#!/bin/bash

. $DIR/functions/functions.sh

# Install OpenVPN with NordVPN configs
installPackage openvpn
installPackage ca-certificates
installPackage unzip

cd /etc/openvpn

if [ -f ovpn.zip ]; then
	rm ovpn.zip
fi

if [ ! -d /etc/openvpn/ovpn_tcp ] || [ ! -d /etc/openvpn/ovpn_udp ]; then
	wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip && \
	unzip ovpn.zip && \
	rm ovpn.zip
fi

# Return to home directory
cd ~