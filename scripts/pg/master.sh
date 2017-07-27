#!/bin/bash

mkdir -p $HOME/logs/pg/master
exec &>> $HOME/logs/pg/master/run.log

echo "-----------$(date)"

API_NAME=$1
API_PASSWORD=$2
PATTERNS=$3

set -x

docker pull rubybench/pg_master

docker run --name postgres -d postgres:9.3.5

docker run --rm \
  --link postgres:postgres \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  rubybench/pg_master

docker stop postgres
docker rm -v postgres
