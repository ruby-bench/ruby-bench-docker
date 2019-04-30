#!/bin/bash

BUNDLER_VERSION=$1
API_NAME=$2
API_PASSWORD=$3
PATTERNS=$4

mkdir -p $HOME/logs/bundler/releases
DATETIME=$(date -d "today" +"%Y%m%d%H%M")
exec &>> $HOME/logs/bundler/releases/$DATETIME-$BUNDLER_VERSION.log

echo
echo
echo
echo
echo --------------$(date)

set -x

docker pull rubybench/bundler_releases

docker run --rm \
  -e "BUNDLER_VERSION=$BUNDLER_VERSION" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  rubybench/bundler_releases
