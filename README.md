# Self Hosted YOURLS (URL Shortener) [![Built on Awesome YOURLS](https://img.shields.io/badge/Awesome-YOURLS-C5A3BE)](https://github.com/YOURLS/awesome-yourls/)

## Overview

This repo aims to use [Docker](https://www.docker.com/) and [Docker-Compose](https://docs.docker.com/compose/) to create a ready-to-use self-hosted instance of the famous URL shortner [YOURLS](https://yourls.org/) (alongside a MariaDB database).

The custom YOURLS image comes with the following preinstalled theme and plugins:

- [Sleeky Theme](https://sleeky.flynntes.com/) (only backend)
- [YOURLS 404 if not found](https://github.com/YOURLS/404-if-not-found)
- [Always-302](https://github.com/tinjaw/Always-302)
- [YOURLS IP Viewer](https://github.com/faab007nl/Yourls-Ip-Viewer)
- [yourls-linklist](https://github.com/VittorioBurani/yourls-linklist) (my fork, Optional)

## Prerequisites

Install [Docker (Engine)](https://docs.docker.com/engine/install/) and [Docker-Compose](https://docs.docker.com/compose/install/linux/).

## Usage

All the following command must be run from the root directory of the cloned repository.

### Configuration

The `.env` file is used to manage the Docker network configuration: both Docker compose files use this as the default env-file for both the container (yourls and db). Modify this file variables in order to match your configuration:

- **USE_LINKLIST**: set it to 1 to use `yourls-linklist` plugin (only at **build time**)
- **HOST_DOMAIN**: server's domain
- **HOST_IP**: ip address og the host machine
- **HOST_PORT**: which host machine port to bind to yourls container port 80
- **ADMIN_USER**: yourls admin username
- **ADMIN_PASSWORD**: yourls admin password
- **DB_ROOT_PASSWORD**: database root password
- **DB_PASSWORD**: database "yourls" user password

### Pre-built images

To run the Docker network with pre-built images use the `docker-compose.yml` file. Simply run (the `-d` option allows to run in detached mode):

```shell
docker compose up -d
```

The pre-built custom yourls image is currently built for `amd64` and `arm64v8` architectures.

### Build and Run your image

The `docker-compose.development.yml` is intended to build and run your custom image. It's helpful during development. To use this compose file run:

```shell
docker compose -f ./docker-compose.development.yml up
```

To run in detached mode append the `-d` option.

## Licence

This package is licensed under the [MIT License](LICENSE).
