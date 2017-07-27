FROM rubybench/ruby:0.5

LABEL maintainer="https://github.com/bmarkons"

ADD runner runner

RUN chmod 755 runner
RUN apt-get update && apt-get install -y \
      rubygems \
      postgresql-client
RUN git clone --verbose --branch master --single-branch --single-branch https://github.com/ruby-bench/ruby-bench-suite.git
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install bundler

CMD /bin/bash -l -c "./runner"
