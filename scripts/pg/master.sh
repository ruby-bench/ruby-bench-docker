#!/bin/bash

COMMIT_HASH=$1
API_NAME=$2
API_PASSWORD=$3
PATTERNS=$4

mkdir -p $HOME/logs/pg/master
DATETIME=$(date -d "today" +"%Y%m%d%H%M")
exec &>> $HOME/logs/pg/master/$DATETIME-$COMMIT_HASH.log

echo
echo
echo
echo
echo "-------------$(date)"

set -x

cd $HOME/ruby-bench-docker/pg

docker-compose run \
  -e "PG_COMMIT_HASH=$COMMIT_HASH" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  pg_master \
  /bin/bash -l -c "./runner"

docker-compose down -v
