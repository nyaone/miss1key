#!/bin/bash

## Pull images listed on compose file
docker-compose -f ./docker-compose/docker-compose.caddy.yml pull
docker-compose -f ./docker-compose/docker-compose.misskey.yml pull
