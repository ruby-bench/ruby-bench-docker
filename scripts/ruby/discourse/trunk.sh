#!/bin/bash

RUBY_COMMIT_HASH=$1
API_NAME=$2
API_PASSWORD=$3
PATTERNS=$4

mkdir -p $HOME/logs/ruby/discourse/trunk
DATETIME=$(date -d "today" +"%Y%m%d%H%M")
exec &>> $HOME/logs/ruby/discourse/trunk/$DATETIME-$RUBY_COMMIT_HASH.log

echo
echo
echo
echo
echo --------------$(date)

set -x

cd $HOME/ruby-bench-docker/ruby/ruby_trunk/discourse_benchmarks/

docker-compose run \
  -e "RUBY_COMMIT_HASH=$RUBY_COMMIT_HASH" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  discourse_ruby_trunk \
  /bin/bash -l -c "./runner"

docker-compose down -v
