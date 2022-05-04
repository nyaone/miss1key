#!/bin/bash

## Start services
docker-compose -f ./docker-compose/docker-compose.misskey.yml up -d
docker-compose -f ./docker-compose/docker-compose.caddy.yml up -d
