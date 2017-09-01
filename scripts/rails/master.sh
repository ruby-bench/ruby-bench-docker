#!/bin/bash

mkdir -p $HOME/logs/rails/master
exec &>> $HOME/logs/rails/master/run.log

echo
echo
echo
echo
echo --------------$(date)

COMMIT_HASH=$1
API_NAME=$2
API_PASSWORD=$3
PATTERNS=$4

set -x

cd $HOME/ruby-bench-docker/rails/master

docker-compose run \
  -e "RAILS_COMMIT_HASH=$COMMIT_HASH" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "MYSQL2_PREPARED_STATEMENTS=1" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  rails_master \
  /bin/bash -l -c "./runner"

docker-compose down -v
