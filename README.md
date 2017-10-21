# Docker images for RubyBench suites

<div align="center">
  <img src="ruby-bench-docker-logo.png" width="200">
</div>

## Ruby trunk

#### Build base image for Ruby benchmarks
```
sudo docker build --no-cache -t rubybench/ruby_trunk .
```

#### Run Ruby benchmarks
```
sudo docker run --rm \
-e "RUBY_BENCHMARKS=true" \
-e "RUBY_MEMORY_BENCHMARKS=true" \
-e "RUBY_COMMIT_HASH=<commit sha1>" \
-e "API_NAME=<API NAME>" \
-e "API_PASSWORD=<API PASSWORD>" \
-e "INCLUDE_PATTERNS=<pattern1,pattern2,pattern3>"
rubybench/ruby_trunk
```
## Ruby Releases

### Ruby Benchmarks

#### Build base image for Ruby benchmarks
```
sudo docker build --no-cache -t rubybench/ruby_releases_base .
sudo docker build --no-cache -t rubybench/ruby_releases .
```

#### Run Ruby benchmarks
```
sudo docker run --rm \
-e "RUBY_BENCHMARKS=true" \
-e "RUBY_MEMORY_BENCHMARKS=true" \
-e "RUBY_VERSION=<ruby version>" \
-e "API_NAME=<API NAME>" \
-e "API_PASSWORD=<API PASSWORD>" \
-e "INCLUDE_PATTERNS=<pattern1,pattern2,pattern3>"
rubybench/ruby_releases
```

### Discourse Benchmarks

#### Build base image for Discourse benchmarks
```
sudo docker build --no-cache -t rubybench/ruby_releases_base .
sudo docker build --no-cache -t rubybench/ruby_releases_discourse .
```

#### Setup containers for Redis server and PostgreSQL
```
sudo docker run --name discourse_redis -d redis:2.8.19 && sudo docker run --name discourse_postgres -d postgres:9.3.5
```

#### Run Discourse benchmarks
```
sudo docker run --rm \
--link discourse_postgres:postgres \
--link discourse_redis:redis \
-e "RUBY_VERSION=<ruby version>" \
-e "API_NAME=<API NAME>" \
-e "API_PASSWORD=<API PASSWORD>"
rubybench/ruby_releases_discourse
```

# Discourse Benchmarks

## Benchmarking Discourse against Ruby trunk

#### Build base image for Discourse
```
cd ruby/ruby_trunk/discourse_benchmarks
sudo docker build --no-cache -t rubybench/ruby_trunk_discourse .
```

#### Setup containers for Redis server and PostgreSQL
```
sudo docker run --name discourse_redis -d redis:2.8.19 && sudo docker run --name discourse_postgres -d postgres:9.3.5
```

#### Run benchmarks
```
sudo docker run --rm \
--link discourse_postgres:postgres \
--link discourse_redis:redis \
-e "RUBY_COMMIT_HASH=<ruby commit sha1>" \
-e "API_NAME=<API NAME>" \
-e "API_PASSWORD=<API PASSWORD>" \
rubybench/ruby_trunk_discourse
```

# Rails Benchmarks

## Rails Releases

#### Build base image
```
cd rails/rails_releases/rails_benchmarks
sudo docker build --no-cache -t rubybench/rails_releases .
```

#### Setup containers for PostgreSQL and MySQL
```
sudo docker run --name postgres -d postgres:9.3.5 && \
sudo docker run --name mysql -e "MYSQL_ALLOW_EMPTY_PASSWORD=yes" -d mysql:5.6.24 && \
sudo docker run --name redis -d redis:2.8.19
```

#### Run benchmarks
```
sudo docker run --rm \
--link postgres:postgres \
--link mysql:mysql \
--link redis:redis \
-e "RAILS_VERSION=<Rails version>" \
-e "API_NAME=<API NAME>" \
-e "API_PASSWORD=<API PASSWORD>" \
-e "INCLUDE_PATTERNS=<pattern1,pattern2,pattern3>" \
rubybench/rails_releases
```

## Rails Trunk

#### Build base image
```
cd rails/rails_trunk/rails_benchmarks
sudo docker build --no-cache -t rubybench/rails_trunk .
```

#### Setup containers for PostgreSQL and MySQL
```
sudo docker run --name postgres -d postgres:9.3.5 && \
sudo docker run --name mysql -e "MYSQL_ALLOW_EMPTY_PASSWORD=yes" -d mysql:5.6.24 && \
sudo docker run --name redis -d redis:2.8.19
```

#### Run benchmarks
```
sudo docker run --rm \
--link postgres:postgres \
--link mysql:mysql \
--link redis:redis \
-e "RAILS_COMMIT_HASH=<commit sha1>" \
-e "API_NAME=<API NAME>" \
-e "API_PASSWORD=<API PASSWORD>" \
-e "INCLUDE_PATTERNS=<pattern1,pattern2,pattern3>" \
rubybench/rails_trunk
```
