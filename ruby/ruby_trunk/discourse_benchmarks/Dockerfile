FROM rubybench/ruby:0.1
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

# Required for Discourse bench
RUN apt-get install wget

RUN git clone --verbose --branch master --single-branch https://github.com/discourse/discourse.git
RUN git clone --verbose --branch trunk --single-branch https://github.com/ruby/ruby.git

ADD database.yml database.yml
ADD discourse.conf discourse.conf
ADD discourse_profile.dump discourse_profile.dump
ADD bench.rb bench.rb
ADD cache cache
ADD runner runner
ADD config.sub /ruby/tool/config.sub
ADD config.guess /ruby/tool/config.guess
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner"
