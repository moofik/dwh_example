#!/bin/bash

pg() {
  local base_dir=$(dirname ${DIR})
  local work_dir=$(pwd | sed "s:${base_dir}:${PROJECT_DIR}:")

  if [[ ${work_dir} == $(pwd) ]]; then
    work_dir="${PROJECT_DIR}"
  fi

  ${SUDO_CMD} docker run \
    -it \
    --rm \
    -v ${DIR}:${PROJECT_DIR} \
    -w ${work_dir} \
    -e POSTGRES_PASSWORD=example \
    --network dwhexample \
    dwhexample/postgresql \
    "$@"
}

dbt() {
  local base_dir=$(dirname ${DIR})
  local work_dir=$(pwd | sed "s:${base_dir}:${PROJECT_DIR}:")

  if [[ ${work_dir} == $(pwd) ]]; then
    work_dir="${PROJECT_DIR}"
  fi

  ${SUDO_CMD} docker run \
    -it \
    --rm \
    -v ${DIR}:${PROJECT_DIR} \
    -w ${work_dir} \
    -e DBT_PROFILES_DIR=${work_dir} \
    -e DBT_PROJECT_DIR=${work_dir} \
    --network dwhexample \
    dwhexample/dbt \
    "$@"
}
