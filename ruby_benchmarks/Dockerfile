FROM tgxworld/ruby:0.1
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN git clone https://github.com/ruby/ruby.git
WORKDIR ruby

ADD runner ruby/runner
ADD driver.rb ruby/benchmark/driver.rb
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner && ruby benchmark/driver.rb --executables ruby -v --repeat-count 10"
