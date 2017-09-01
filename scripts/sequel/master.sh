#!/bin/bash

mkdir -p $HOME/logs/sequel/master
exec &>> $HOME/logs/sequel/master/run.log

echo
echo
echo
echo
echo -------------$(date)

COMMIT_HASH=$1
API_NAME=$2
API_PASSWORD=$3
PATTERNS=$4

set -x

cd $HOME/ruby-bench-docker/sequel/master

docker-compose run \
  -e "SEQUEL_COMMIT_HASH=$COMMIT_HASH" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "MYSQL2_PREPARED_STATEMENTS=1" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  sequel_master \
  /bin/bash -l -c "./runner"

docker-compose down -v
