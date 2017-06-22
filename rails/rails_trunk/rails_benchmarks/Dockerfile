FROM rubybench/ruby:0.5
MAINTAINER Alan Guo Xiang Tan "https://twitter.com/tgx_world"

RUN apt-get update

# Install MySql Server in a Non-Interactive mode. Root password will be left blank.
RUN echo "mysql-server-5.6 mysql-server/root_password password root ''" | debconf-set-selections
RUN echo "mysql-server-5.6 mysql-server/root_password_again password root ''" | debconf-set-selections

RUN apt-get install -y libncurses5-dev libmysqlclient-dev sqlite3 libsqlite3-dev postgresql mysql-server-5.7

RUN git clone --verbose --branch master --single-branch https://github.com/ruby-bench/ruby-bench-suite.git
RUN git clone --verbose --branch master --single-branch https://github.com/rails/rails.git
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc && cd /rails && bundle install --without test doc job"

ADD runner runner
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner"
