#!/bin/bash

RUBY_BENCHMARKS=$1
RUBY_MEMORY_BENCHMARKS=$2
OPTCARROT_BENCHMARK=$3
LIQUID_BENCHMARK=$4
RUBY_COMMIT_HASH=$5
API_NAME=$6
API_PASSWORD=$7
PATTERNS=$8

mkdir -p $HOME/logs/ruby/trunk
DATETIME=$(date -d "today" +"%Y%m%d%H%M")
exec &>> $HOME/logs/ruby/trunk/$DATETIME-$RUBY_COMMIT_HASH.log

echo
echo
echo
echo
echo --------------$(date)

IMAGE_NAME=rubybench/ruby:$RUBY_COMMIT_HASH

if [[ -n $(curl -s -i "https://index.docker.io/v1/repositories/rubybench/ruby/tags/$RUBY_COMMIT_HASH" | grep -o "200 OK") ]]; then
  echo "Ruby image for commit $RUBY_COMMIT_HASH exists on docker hub. Pulling the image..."
  docker pull $IMAGE_NAME
else
  echo "Couldn't find a ruby image for commit $RUBY_COMMIT_HASH. Building image now..."
  cd $HOME/ruby-bench-docker/ruby/ruby_trunk/ruby_benchmarks/per_commit_image
  PUSH=1 ./build $RUBY_COMMIT_HASH
fi

set -x

cd $HOME/ruby-bench-docker/ruby/ruby_trunk/ruby_benchmarks/

docker run --rm -i \
  -e "RUBY_BENCHMARKS=$RUBY_BENCHMARKS" \
  -e "RUBY_MEMORY_BENCHMARKS=$RUBY_MEMORY_BENCHMARKS" \
  -e "OPTCARROT_BENCHMARK=$OPTCARROT_BENCHMARK" \
  -e "LIQUID_BENCHMARK=$LIQUID_BENCHMARK" \
  -e "RUBY_COMMIT_HASH=$RUBY_COMMIT_HASH" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  $IMAGE_NAME \
  /bin/bash -l < runner

docker image rm -f $IMAGE_NAME
