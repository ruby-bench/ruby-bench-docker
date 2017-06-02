#!/bin/bash

mkdir -p $HOME/logs/bundler/releases
exec &>> $HOME/logs/bundler/releases/run.log

echo
echo
echo
echo
echo --------------$(date)

BUNDLER_VERSION=$1
API_NAME=$2
API_PASSWORD=$3
PATTERNS=$4

set -x

docker pull rubybench/bundler_releases

docker run --rm \
  -e "BUNDLER_VERSION=$BUNDLER_VERSION" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  rubybench/bundler_releases
