FROM rubybench/ruby:2.6.3
MAINTAINER Alan Guo Xiang Tan "https://twitter.com/tgx_world"

RUN apt-get update
RUN apt-get install -y libncurses5-dev libmysqlclient-dev sqlite3 libsqlite3-dev postgresql-client mysql-client

RUN git clone --verbose --branch master --single-branch https://github.com/ruby-bench/ruby-bench-suite.git
RUN echo "gem: --no-document" > ~/.gemrc
RUN /bin/bash -l -c "gem install bundler -v 1.17.3"
RUN /bin/bash -l -c "cd /ruby-bench-suite/support/setup && bundle install -j4"
ADD runner runner
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner"
