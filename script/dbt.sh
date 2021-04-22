#!/bin/bash

. $(dirname $0)/functions.sh

DIR=$(readlink -e $(dirname $0))
PROJECT_DIR="/dwhexample"

dbt dbt "$@"
