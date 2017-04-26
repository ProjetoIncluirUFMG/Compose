#!/bin/bash

set -e -x

RUN_PREFIX="docker-compose run --no-deps --rm"

$RUN_PREFIX cadastro-app-front-end yarn install
$RUN_PREFIX cadastro-app-api yarn install
