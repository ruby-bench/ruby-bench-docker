#!/bin/bash

mkdir -p $HOME/logs/sequel/master
exec &>> $HOME/logs/sequel/master/run.log

echo "-----------$(date)"

SEQUEL_COMMIT_HASH=$1
API_NAME=$2
API_PASSWORD=$3
PATTERNS=$4

set -x

docker pull rubybench/sequel_trunk

docker run --name postgres -d postgres:9.3.5
docker run --name mysql -e "MYSQL_ALLOW_EMPTY_PASSWORD=yes" -d mysql:5.6.24
docker run --name redis -d redis:2.8.19

docker run --rm \
  --link postgres:postgres \
  --link mysql:mysql \
  --link redis:redis \
  -e "SEQUEL_COMMIT_HASH=$SEQUEL_COMMIT_HASH" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "MYSQL2_PREPARED_STATEMENTS=1" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  rubybench/sequel_trunk

docker stop postgres mysql redis
docker rm -v postgres mysql redis
