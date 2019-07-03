#!/bin/bash

RUBY_COMMIT_HASH=$1
SCRIPT_NAME=$2
SCRIPT_URL=$3
API_NAME=$4
API_PASSWORD=$5

IMAGE_NAME=rubybench/ruby:$RUBY_COMMIT_HASH

mkdir -p $HOME/logs/ruby/user_scripts
DATETIME=$(date -d "today" +"%Y%m%d%H%M")
exec &>> $HOME/logs/ruby/user_scripts/$SCRIPT_NAME-$DATETIME-$RUBY_COMMIT_HASH.log

cd $HOME/ruby-bench-docker/ruby/ruby_trunk/ruby_benchmarks/per_commit_image

PUSH=1 ./build $RUBY_COMMIT_HASH

cd $HOME/ruby-bench-docker/scripts/ruby/user_scripts
docker run --rm -i \
  -e "SCRIPT_NAME=$SCRIPT_NAME" \
  -e "RUBY_COMMIT_HASH=$RUBY_COMMIT_HASH" \
  -e "SCRIPT_URL=$SCRIPT_URL" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "BENCHMARK_USER_SCRIPT=1" \
  $IMAGE_NAME \
  /bin/bash -l < runner

docker image rm -f $IMAGE_NAME
