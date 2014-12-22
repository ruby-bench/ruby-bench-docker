## Rails Benchmarks

#### Build base image for sample app
```bash
sudo docker build --no-cache -t tgxworld/rails_bench .
```

#### Run Rails benchmarks
````bash
sudo docker run --rm -e "RAILS_COMMIT_HASH=<hash to benchmark against>" -e "RUBY_VERSION=2.1.5" tgxworld/rails_bench
````

## Discourse Benchmarks

### Benchmarking Discourse against Ruby trunk

#### Build base image for Discourse
```bash
cd discourse_benchmarks/ruby_head
sudo docker build --no-cache -t tgxworld/discourse_ruby_trunk_bench .
```

#### Setup containers for Redis server and PostgreSQL
```bash
sudo docker run --name discourse_redis -d redis:2.8.19 && sudo docker run --name discourse_postgres -d postgres:9.3.5
```

#### Run benchmarks
```bash
sudo docker run --rm --link discourse_postgres:postgres --link discourse_redis:redis -e "RUBY_COMMIT_HASH=<ruby commit sha1>" tgxworld/discourse_ruby_trunk_bench
```

### Benchmarking Discourse against Rails head

#### Build base image for Discourse
```bash
cd discourse_benchmarks/rails_head
sudo docker build --no-cache -t tgxworld/discourse_rails_head_bench .
```

#### Setup containers for Redis server and PostgreSQL
```bash
sudo docker run --name discourse_redis -d redis:2.8.19 && sudo docker run --name discourse_postgres -d postgres:9.3.5
```

#### Run benchmarks
```bash
sudo docker run --rm --link discourse_postgres:postgres --link discourse_redis:redis -e "RAILS_COMMIT_HASH=<rails commit sha1>" tgxworld/discourse_rails_head_bench
```

## Ruby Benchmarks

#### Build base image for Ruby benchmarks
```bash
sudo docker build --no-cache -t tgxworld/ruby_bench .
```

#### Run Ruby benchmarks
```bash
sudo docker run --rm -e "RUBY_VERSION=2.1.5" tgxworld/ruby_bench
```
