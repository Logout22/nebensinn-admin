#!/bin/bash

set -o errexit
set -o nounset

docker-compose build --pull
docker-compose up -d
