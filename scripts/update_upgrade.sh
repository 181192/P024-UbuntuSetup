#!/bin/bash

if [[ ! -d "$DIR" ]]; then DIR="$(dirname "$(pwd)")"; fi
. $DIR/functions/variables.sh

# Update all packages and install updates
echo -e "\n${PURPLE}Updating all packages and clean up${NC}"
{
	apt-get update && apt-get upgrade -y && apt-get autoremove -y && apt-get clean
} > /dev/null