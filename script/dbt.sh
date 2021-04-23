#!/bin/bash

. $(dirname $0)/functions.sh

DIR=$(readlink -e $(dirname $0))/../src
PROJECT_DIR="/dbt"
dbt dbt "$@"
