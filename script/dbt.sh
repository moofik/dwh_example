#!/usr/bin/env bash

. $(dirname $0)/functions.sh

DIR=$(readlink -e $(dirname $0))
SUDO_CMD=$(test -w /var/run/docker.sock || echo sudo)
PROJECT_DIR="/dwhexample"

dbt dbt "$@"
