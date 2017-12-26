FROM rubybench/ruby_releases_base:0.7
MAINTAINER Noah Gibbs "the.codefolio.guy@gmail.com"

RUN git clone --branch stable --single-branch --verbose https://github.com/discourse/discourse.git
RUN git clone --branch master --single-branch --verbose https://github.com/noahgibbs/rails_ruby_bench.git
RUN git clone --branch master --single-branch --verbose https://github.com/ruby-bench/ruby-bench-suite.git

# Discourse dependencies not installed on ruby_releases_base
RUN apt-get update && apt-get install -y redis-tools jhead libpcre3-dev imagemagick optipng pngquant gifsicle jpegoptim

# Discourse configuration files
ADD normal_database.yml normal_database.yml
ADD database_migration.yml database_migration.yml
ADD discourse.conf discourse.conf
ADD cache cache

ADD runner runner
RUN chmod 755 runner

ENV RAILS_BENCH_DIR /rails_ruby_bench
ENV DISCOURSE_DIR /discourse

# Discourse stable v1.8.0beta13
ENV DISCOURSE_COMMIT_HASH 02fb86916f5265ad8318c4415229753428c68eaf
ENV RAILS_ENV profile

ENV RRB_COMMIT_HASH e99ff6323c6c36f4acf07419aaa2d1a343123865

CMD /bin/bash -l -c "./runner"
