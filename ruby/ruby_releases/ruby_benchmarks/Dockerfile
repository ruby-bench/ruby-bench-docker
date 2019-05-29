FROM rubybench/ruby_releases_base:20190529.1

RUN git clone --verbose --branch master --single-branch https://github.com/ruby-bench/ruby-bench-suite.git

ADD runner runner
RUN chmod 755 runner

# To avoid invalid byte sequence in benchmark_driver's source handling
ENV LANG C.UTF-8

RUN apt-get install time

CMD /bin/bash -l -c "./runner"
