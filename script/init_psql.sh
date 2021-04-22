#!/usr/bin/env bash

. $(dirname $0)/functions.sh

DIR=$(readlink -e $(dirname $0))
SUDO_CMD=$(test -w /var/run/docker.sock || echo sudo)
PROJECT_DIR="/dwhexample"

if [[ -z "$@" ]]; then
  pg -u postgres psql -h masterhome -U postgres -f /docker-entrypoint-initdb.d/create_db.sql
  exit 0
fi

pg psql "$@"
