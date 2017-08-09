#!/bin/bash

mkdir -p $HOME/logs/pg/master
exec &>> $HOME/logs/pg/master/run.log

echo
echo
echo
echo
echo "-------------$(date)"

API_NAME=$1
API_PASSWORD=$2
PATTERNS=$3

set -x

cd $HOME/ruby-bench-docker/rails/master

docker-compose run \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  pg_master \
  /bin/bash -l -c "./runner"

docker-compose down
