#!/bin/bash

set -e -x

RUN_PREFIX="docker-compose run --no-deps --rm"

$RUN_PREFIX cadastro-front-end yarn install
$RUN_PREFIX api yarn install
