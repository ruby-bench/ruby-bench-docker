FROM tgxworld/ruby:0.1
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN git clone --verbose https://github.com/ruby/ruby.git

ADD runner runner
ADD driver.rb driver.rb
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner && ruby ruby/benchmark/driver.rb --executables ruby -v --repeat-count 1"
