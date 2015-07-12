FROM rubybench/ruby:0.3
MAINTAINER Alan Guo Xiang Tan "https://twitter.com/tgx_world"

ENV RAILS_MASTER 1

RUN apt-get update
RUN apt-get install -y libmysqlclient-dev sqlite3 libsqlite3-dev postgresql mysql-server-5.6

RUN git clone --verbose --branch master --single-branch https://github.com/ruby-bench/ruby-bench-suite.git
RUN git clone --verbose --branch master --single-branch https://github.com/rails/rails.git
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc && cd /rails && bundle install"

ADD runner runner
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner"
