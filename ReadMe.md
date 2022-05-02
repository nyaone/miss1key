# Miss1key

> 1 key script for Misskey

## Structure

```
                    +---------+ 
                    | Scripts | ---------+
                    +---------+          |
                    +--------------------x---------------------+
                    |              Docker(Compose)             |
    +--------+      |+----------------+      +----------------+|
    | Client | ---> || Caddy (80/443) | -x-> | Misskey (3000) ||
    +--------+      |+----------------+  |   +----------------+|
                    +------------------------------------------+
```

## Workflow

### Bootstrap

1. Detect if user is root, otherwise try to sudo
2. Prepare dependencies with package manager
   - curl
   - git
3. Clone this repo for detailed scripts & config files
4. RUN following scripts
   1. prepare-docker.sh
   2. generate-config.sh
   3. pull-images.sh
   4. start-service.sh

### Prepare Docker

1. Detect if docker is installed, if not install it
2. Detect if docker-compose is installed, if not install it
3. Detect if docker service is running, if not try to start it

### Generate Config

1. Let user specify deployment domain
2. Save deploy config
3. Generate config file from templates for Misskey and Caddy

### Pull Images

1. Pull Misskey image from DockerHub
2. Pull Caddy image from DockerHub

### Start Service

1. Start Misskey service
2. Start Caddy service
