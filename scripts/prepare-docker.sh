#!/bin/bash

## Detect if docker is installed
if [ -x "$(command -v docker)" ]; then
    echo "Docker is already installed"
else
    echo "Installing docker..."
    bash <(curl -L -s https://get.docker.com)
fi

## Detect if docker-compose is installed
if [ -x "$(command -v docker-compose)" ]; then
    echo "Docker-compose is already installed"
else
    echo "Installing docker-compose..."
    curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
fi

## Detect if docker is running
if [ "$(docker info | grep -c '^Containers:')" -gt 0 ]; then
    echo "Docker is already running"
else
    echo "Starting docker..."
    systemctl start docker
fi
