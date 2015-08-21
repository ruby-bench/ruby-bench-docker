FROM rubybench/ruby_releases_base:0.1
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN git clone --verbose --branch master --single-branch https://github.com/ruby-bench/ruby-bench-suite.git

ADD runner runner
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner"
