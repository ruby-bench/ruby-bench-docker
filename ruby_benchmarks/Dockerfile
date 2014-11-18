FROM tgxworld/ruby:0.1
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN git clone https://github.com/ruby/ruby.git
WORKDIR ruby

ADD runner.rb ruby/runner.rb

CMD /bin/bash -l -c "ruby runner.rb && ruby benchmark/run.rb --ruby=ruby -r"
