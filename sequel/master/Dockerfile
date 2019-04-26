FROM rubybench/ruby:0.5
MAINTAINER Alan Guo Xiang Tan "https://twitter.com/tgx_world"

RUN apt-get update && apt-get install -y \
      libncurses5-dev \
      libmysqlclient-dev \
      postgresql-client \
      mysql-client

RUN git clone --verbose --branch master --single-branch https://github.com/ruby-bench/ruby-bench-suite.git
RUN git clone --verbose --branch master --single-branch https://github.com/jeremyevans/sequel.git
RUN /bin/bash -l -c "gem install bundler --no-document && cd /sequel && bundle install --without test doc job"

ADD runner runner
RUN chmod 755 runner
