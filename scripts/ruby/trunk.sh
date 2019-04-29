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
exec &>> $HOME/logs/ruby/trunk/$RUBY_COMMIT_HASH-$DATETIME.log

echo
echo
echo
echo
echo --------------$(date)

set -x

docker pull rubybench/ruby_trunk

docker run --rm \
  -e "RUBY_BENCHMARKS=$RUBY_BENCHMARKS" \
  -e "RUBY_MEMORY_BENCHMARKS=$RUBY_MEMORY_BENCHMARKS" \
  -e "OPTCARROT_BENCHMARK=$OPTCARROT_BENCHMARK" \
  -e "LIQUID_BENCHMARK=$LIQUID_BENCHMARK" \
  -e "RUBY_COMMIT_HASH=$RUBY_COMMIT_HASH" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  rubybench/ruby_trunk
