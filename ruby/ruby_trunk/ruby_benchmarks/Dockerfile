FROM rubybench/ruby:0.3
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN git clone --verbose --branch trunk --single-branch https://github.com/ruby/ruby.git
RUN git clone --verbose --branch master --single-branch https://github.com/ruby-bench/ruby-bench-suite.git
RUN gem install benchmark_driver -v 0.12.0 && gem install benchmark_driver-output-rubybench -v 0.2.0

ADD runner runner
ADD config.sub /ruby/tool/config.sub
ADD config.guess /ruby/tool/config.guess
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner"
