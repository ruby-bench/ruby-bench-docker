FROM tgxworld/ruby:0.1
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN sudo apt-get install sqlite3 libsqlite3-dev
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

RUN git clone https://github.com/rails-bench/ko1-test-app.git
WORKDIR ko1-test-app

ADD runner.rb ko1-test-app/runner.rb

CMD /bin/bash -l -c "ruby runner.rb && bundle exec rake -f perf.rake allocated_objects"
