FROM rubybench/ruby:2.6.3
MAINTAINER Guo Xiang

# To avoid invalid byte sequence in benchmark_driver's source handling
ENV LANG C.UTF-8

RUN apt-get install time

ARG RUBY_COMMIT_HASH
ENV RUBY_COMMIT_HASH=$RUBY_COMMIT_HASH

RUN git clone --verbose --branch trunk --single-branch https://github.com/ruby/ruby.git

ADD config.sub /ruby/tool/config.sub
ADD config.guess /ruby/tool/config.guess

RUN cd /ruby && \
    git reset --hard $RUBY_COMMIT_HASH && \
    /bin/bash -l -c "autoconf && \
      ./configure --quiet --disable-install-doc && \
      make --quiet -j && \
      make install --quiet -j && \
      rbenv global system"
