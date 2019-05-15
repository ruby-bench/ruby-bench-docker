#!/bin/bash

SCRIPT_URL=$1
RUBY_COMMIT_A=$2
RUBY_COMMIT_B=$3
API_NAME=$4
API_PASSWORD=$5

if [[ -d ~/ruby ]]; then
  git -C ~/ruby pull
else
  git clone https://github.com/ruby/ruby ~/ruby
fi

cd ~/ruby

RUBY_COMMIT_A=$(git rev-parse $RUBY_COMMIT_A)
RUBY_COMMIT_B=$(git rev-parse $RUBY_COMMIT_B)

git rev-list --reverse ^$RUBY_COMMIT_A~ $RUBY_COMMIT_B | while read -r commit ; do
  IMAGE_NAME=rubybench/ruby:$commit

  cd $HOME/ruby-bench-docker/ruby/ruby_trunk/ruby_benchmarks/per_commit_image
  PUSH=1 ./build $commit

  cd $HOME/ruby-bench-docker/scripts/ruby/custom_scripts
  docker run --rm -i \
    -e "RUBY_COMMIT_HASH=$commit" \
    -e "SCRIPT_URL=$SCRIPT_URL" \
    -e "API_NAME=$API_NAME" \
    -e "API_PASSWORD=$API_PASSWORD" \
    $IMAGE_NAME \
    /bin/bash -l < runner

  docker image rm -f $IMAGE_NAME
done
