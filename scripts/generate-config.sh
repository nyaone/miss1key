#!/bin/bash

## Prompt user for deployment domain, 
## or get from environment variable
if [ -z "$DOMAIN" ]; then
    read -p "Enter deployment domain: " DOMAIN
fi

## Generate random database password
DB_PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

## Prepare config directory
mkdir -p config
mkdir -p config/caddy config/misskey

## Save deploy config
echo "DOMAIN=$DOMAIN" > config/deploy.env
echo "DB_PASSWORD=$DB_PASSWORD" >> config/deploy.env

## Generate config file from templates
### Caddyfile
cp templates/Caddyfile config/caddy/Caddyfile
sed -i "s/miss.1key/$DOMAIN/g" config/caddy/Caddyfile

### Misskey Config
cp templates/misskey.yml config/misskey/default.yml
sed -i "s/example.tld/$DOMAIN/g" config/misskey/default.yml
sed -i "s/example-misskey-pass/$DB_PASSWORD/g" config/misskey/default.yml

### DB Docker Environments
cp templates/db.env config/misskey/db.env
sed -i "s/example-misskey-pass/$DB_PASSWORD/g" config/misskey/db.env
