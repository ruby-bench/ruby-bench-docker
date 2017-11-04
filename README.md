<img align="right" src="ruby-bench-docker-logo.png" width="200">

# Docker images for RubyBench suite

We run all benchmarks in Docker containers to take advantage of isolated run environment, which provides us with consistent results.
Each run boots new fresh container and which is removed once the run has finished.

## Maintained Docker images
You can pull each image from [Dockerhub](https://hub.docker.com/u/rubybench/) with:
```
docker pull <image>
```

#### rubybench/ruby_trunk

Intended to run Ruby benchmarks on a per-commit basis:

```
docker run --rm \
  -e "RUBY_BENCHMARKS=true" \
  -e "RUBY_MEMORY_BENCHMARKS=true" \
  -e "RUBY_COMMIT_HASH=<commit sha1>" \
  -e "API_NAME=<API NAME>" \
  -e "API_PASSWORD=<API PASSWORD>" \
  -e "INCLUDE_PATTERNS=<pattern1,pattern2,pattern3>"
  rubybench/ruby_trunk
```

#### rubybench/ruby_releases

Intended to run Ruby benchmarks on a per-release basis:

```
docker run --rm \
  -e "RUBY_BENCHMARKS=true" \
  -e "RUBY_MEMORY_BENCHMARKS=true" \
  -e "RUBY_VERSION=<ruby version>" \
  -e "API_NAME=<API NAME>" \
  -e "API_PASSWORD=<API PASSWORD>" \
  -e "INCLUDE_PATTERNS=<pattern1,pattern2,pattern3>"
  rubybench/ruby_releases
```

#### rubybench/ruby_trunk_discourse
###### TODO: run with docker-compose

Intended to run Discourse benchmarks for each Ruby commit:

```
docker run --name discourse_redis -d redis:2.8.19
docker run --name discourse_postgres -d postgres:9.3.5

docker run --rm \
  --link discourse_postgres:postgres \
  --link discourse_redis:redis \
  -e "RUBY_COMMIT_HASH=<ruby commit sha1>" \
  -e "API_NAME=<API NAME>" \
  -e "API_PASSWORD=<API PASSWORD>" \
  rubybench/ruby_trunk_discourse
```

#### rubybench/ruby_releases_discourse
###### TODO: run with docker-compose

Intended to run Discourse benchmarks for each Ruby release:

```
sudo docker run --name postgres -d postgres:9.3.5 && \
sudo docker run --name mysql -e "MYSQL_ALLOW_EMPTY_PASSWORD=yes" -d mysql:5.6.24 && \
sudo docker run --name redis -d redis:2.8.19

docker run --name discourse_redis -d redis:2.8.19
docker run --name discourse_postgres -d postgres:9.3.5

docker run --rm \
  --link discourse_postgres:postgres \
  --link discourse_redis:redis \
  -e "RUBY_VERSION=<ruby version>" \
  -e "API_NAME=<API NAME>" \
  -e "API_PASSWORD=<API PASSWORD>"
  rubybench/ruby_releases_discourse
```

#### rubybench/rails_trunk

Intended to run Rails benchmarks on a per-commit basis:

```
docker-compose run \
  -e "RAILS_COMMIT_HASH=$COMMIT_HASH" \
  -e "API_NAME=$API_NAME" \
  -e "API_PASSWORD=$API_PASSWORD" \
  -e "MYSQL2_PREPARED_STATEMENTS=1" \
  -e "INCLUDE_PATTERNS=$PATTERNS" \
  rails_master \
  /bin/bash -l -c "./runner"
```

#### rubybench/rails_release
###### TODO: run with docker-compose

Intended to run Rails benchmarks on a per-release basis:

```
sudo docker run --name postgres -d postgres:9.3.5
sudo docker run --name mysql -e "MYSQL_ALLOW_EMPTY_PASSWORD=yes" -d mysql:5.6.24
sudo docker run --name redis -d redis:2.8.19

docker run --rm \
  --link postgres:postgres \
  --link mysql:mysql \
  --link redis:redis \
  -e "RAILS_VERSION=<Rails version>" \
  -e "API_NAME=<API NAME>" \
  -e "API_PASSWORD=<API PASSWORD>" \
  -e "INCLUDE_PATTERNS=<pattern1,pattern2,pattern3>" \
  rubybench/rails_releases
```
