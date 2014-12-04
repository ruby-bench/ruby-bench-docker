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

#### Build base image for Discourse
```bash
cd discourse_benchmarks
sudo docker build --no-cache -t tgxworld/discourse_bench .
```

#### Setup containers for Redis server and PostgreSQL
```bash
sudo docker run -d redis && sudo docker run --name discourse_postgres -d postgres
```

#### Run Discourse benchmarks
```bash
sudo docker run --rm --name discourse_benchmarks --link discourse_postgres:postgres --link discourse_redis:redis -e "RAILS_COMMIT_HASH=<hash to benchmark against>" -e "RUBY_VERSION=2.1.5" tgxworld/discourse_bench
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
