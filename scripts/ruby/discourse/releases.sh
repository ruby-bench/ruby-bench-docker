#!/bin/bash

RUBY_VERSION=$1
API_NAME=$2
API_PASSWORD=$3
PATTERNS=$4

mkdir -p $HOME/logs/ruby/discourse/releases
DATETIME=$(date -d "today" +"%Y%m%d%H%M")
exec &>> $HOME/logs/ruby/discourse/releases/$DATETIME-$RUBY_VERSION.log

echo
echo
echo
echo
echo --------------$(date)

set -x

cd $HOME/ruby-bench-docker/ruby/ruby_releases/discourse_benchmarks/

docker-compose run \
  -e "RUBY_VERSION=$RUBY_VERSION" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  discourse_ruby_releases \
  /bin/bash -l -c "./runner"

docker-compose down -v
