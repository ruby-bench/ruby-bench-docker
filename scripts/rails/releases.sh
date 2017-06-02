#!/bin/bash

mkdir -p $HOME/logs/rails/releases
exec &>> $HOME/logs/rails/releases/run.log

echo
echo
echo
echo
echo "-------------- $(date)"

RAILS_VERSION=$1
API_NAME=$2
API_PASSWORD=$3
CUSTOM_ENV=$4
PATTERNS=$5

set -x

docker pull rubybench/rails_releases

docker run --name postgres -d postgres:9.3.5
docker run --name mysql -e "MYSQL_ALLOW_EMPTY_PASSWORD=yes" -d mysql:5.6.24
docker run --name redis -d redis:2.8.19

docker run --rm \
  --link postgres:postgres \
  --link mysql:mysql \
  --link redis:redis \
  -e "RAILS_VERSION=$RAILS_VERSION" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  $CUSTOM_ENV \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  rubybench/rails_releases

docker stop postgres mysql redis
docker rm -v postgres mysql redis
