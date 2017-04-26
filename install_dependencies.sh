#!/bin/bash

set -e -x

RUN_PREFIX="docker-compose run --no-deps --rm"

$RUN_PREFIX cadastro-app-front-end npm install
$RUN_PREFIX cadastro-app-api npm install
