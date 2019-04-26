FROM rubybench/ruby:0.5

LABEL maintainer="https://github.com/bmarkons"

RUN apt-get update && apt-get install -y postgresql-client

RUN git clone --verbose --branch master --single-branch https://github.com/ruby-bench/ruby-bench-suite.git
RUN git clone --verbose --branch master --single-branch https://github.com/ged/ruby-pg.git

RUN echo "gem: --no-document" > ~/.gemrc
RUN /bin/bash -l -c "gem install bundler"

ADD runner runner
RUN chmod 755 runner
