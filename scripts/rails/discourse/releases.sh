#!/bin/bash

RAILS_VERSION=$1
API_NAME=$2
API_PASSWORD=$3
PATTERNS=$5

mkdir -p $HOME/logs/rails/releases/discourse
DATETIME=$(date -d "today" +"%Y%m%d%H%M")
exec &>> $HOME/logs/rails/releases/discourse/$DATETIME-$RAILS_VERSION.log

echo
echo
echo
echo
echo "-------------- $(date)"

set -x

cd $HOME/ruby-bench-docker/rails/release/discourse/

docker-compose run \
  -e "RAILS_VERSION=$RAILS_VERSION" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  discourse_rails_releases \
  /bin/bash -l -c "./runner"

docker-compose down -v
