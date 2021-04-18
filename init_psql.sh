#!/usr/bin/env bash

DIR=$(readlink -e $(dirname $0))
SUDO_CMD=$(test -w /var/run/docker.sock || echo sudo)
PROJECT_DIR="/dwhexample"
COMPOSER_HOME=${COMPOSER_HOME:-${DIR}/volumes/composer}

pg() {
    local base_dir=$(dirname ${DIR})
    local work_dir=$(pwd | sed "s:${base_dir}:${PROJECT_DIR}:")

    if [[ ${work_dir} = $(pwd) ]]; then
        work_dir="${PROJECT_DIR}"
    fi

    ${SUDO_CMD} docker run \
        -it \
        --rm \
        -v ${DIR}:${PROJECT_DIR} \
        -w ${work_dir} \
        -e POSTGRES_HOST_AUTH_METHOD=trust \
        --network dwhexample \
        dwhexample/postgresql \
        "$@"
}

if [[ -z "$@" ]]; then
      pg -u postgres psql -h masterhome -U postgres -f /docker-entrypoint-initdb.d/create_db.sql
    exit 0
fi

pg psql "$@"