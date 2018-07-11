FROM rubybench/ruby_releases_base:20180410.1

RUN /bin/bash -l -c "git -C /root/.rbenv/plugins/ruby-build pull origin master && rbenv install 2.6.0-preview2"
RUN git clone --verbose --branch master --single-branch https://github.com/ruby-bench/ruby-bench-suite.git

ADD runner runner
RUN chmod 755 runner

# To avoid invalid byte sequence in benchmark_driver's source handling
ENV LANG C.UTF-8

RUN apt-get install time

CMD /bin/bash -l -c "./runner"
