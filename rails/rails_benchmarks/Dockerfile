FROM tgxworld/ruby:2.2.1
MAINTAINER Kir Shatorv "shatrov@me.com"

RUN apt-get install -y libmysqlclient-dev libsqlite3-dev
RUN git clone --verbose --branch master --single-branch https://github.com/rails/rails.git
RUN git clone --verbose --branch master --single-branch https://github.com/ruby-bench/ruby-bench-suite.git

ADD bench.rb bench.rb
ADD runner runner
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner"
