FROM rubybench/ruby:0.3
MAINTAINER Guo Xiang

RUN git clone --verbose --branch trunk --single-branch https://github.com/ruby/ruby.git
RUN git clone --verbose --branch master --single-branch https://github.com/ruby-bench/ruby-bench-suite.git

ADD runner runner
ADD config.sub /ruby/tool/config.sub
ADD config.guess /ruby/tool/config.guess
RUN chmod 755 runner

# To avoid invalid byte sequence in benchmark_driver's source handling
ENV LANG C.UTF-8

RUN apt-get install time

CMD /bin/bash -l -c "./runner"
