#!/bin/bash

SEQUEL_VERSION=$1
API_NAME=$2
API_PASSWORD=$3
PATTERNS=$4

mkdir -p $HOME/logs/sequel/releases
DATETIME=$(date -d "today" +"%Y%m%d%H%M")
exec &>> $HOME/logs/sequel/releases/$DATETIME-$SEQUEL_VERSION.log

echo "-----------$(date)"

set -x

docker pull rubybench/sequel_releases

docker run --name postgres -d postgres:9.6 -c shared_buffers=500MB -c fsync=off -c full_page_writes=off
docker run --name mysql -e "MYSQL_ALLOW_EMPTY_PASSWORD=yes" -d mysql:5.6.24
docker run --name redis -d redis:2.8.19

docker run --rm \
  --link postgres:postgres \
  --link mysql:mysql \
  --link redis:redis \
  -e "SEQUEL_VERSION=$SEQUEL_VERSION" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "MYSQL2_PREPARED_STATEMENTS=1" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  rubybench/sequel_releases

docker stop postgres mysql redis
docker rm -v postgres mysql redis
