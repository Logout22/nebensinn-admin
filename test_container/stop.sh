#!/bin/bash

set -o errexit
set -o nounset

docker-compose down --remove-orphans
