#!/bin/bash

## Detect if user is root, otherwise sudo
if [ "$(id -u)" != "0" ]; then
    sudo "$0" "$@"
    exit $?
fi

## Detect package manager
if [ -f /etc/redhat-release ]; then
    PACKAGE_MANAGER="yum"
elif [ -f /etc/debian_version ]; then
    PACKAGE_MANAGER="apt"
else
    echo "Unable to detect package manager"
    exit 1
fi

## List of packages to install
DEPENDENCIES="git curl"

## Install necessary packages
if [ "$PACKAGE_MANAGER" == "yum" ]; then
    yum update -y
    yum install -y $DEPENDENCIES
elif [ "$PACKAGE_MANAGER" == "apt" ]; then
    apt update -y
    apt install -y $DEPENDENCIES
else
    echo "Unable to install packages"
    exit 1
fi

## Clone this repo
git clone https://github.com/nyaone/miss1key.git ~/miss1key
cd ~/miss1key

## Run other scripts
./scripts/prepare-docker.sh
./scripts/generate-config.sh
./scripts/pull-images.sh
./scripts/start-service.sh
