FROM rubybench/ruby_releases_base:20180410.1

RUN git clone --verbose --branch master --single-branch https://github.com/ruby-bench/ruby-bench-suite.git
RUN gem install benchmark_driver -v 0.12.0 && gem install benchmark_driver-output-rubybench -v 0.2.0

ADD runner runner
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner"
