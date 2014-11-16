## Discourse Benchmarks

#### Build base image for Discourse
```bash
cd discourse_benchmarks
sudo docker build --no-cache -t bench/discourse_bench .
```


#### Setup containers for Redis server and PostgreSQL
```bash
sudo docker run --name discourse_redis -d redis && sudo docker run --name discourse_postgres -d postgres
```

#### Run Discourse benchmarks
```bash
sudo docker run --rm --name discourse_benchmarks --link discourse_postgres:postgres --link discourse_redis:redis -e "RAILS_COMMIT_HASH=<hash to benchmark against>" bench/discourse_bench
```

## Ruby Benchmarks

#### Build base image for Ruby benchmarks
```bash
sudo docker build -t bench/ruby_bench .
```

#### Run Ruby benchmarks
```bash
sudo docker run --rm --name ruby_benchmarks bench/ruby_bench
```
