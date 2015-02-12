FROM tgxworld/ruby_releases_base
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

# Required for Discourse bench
RUN apt-get install wget

RUN git clone --branch master --single-branch --verbose https://github.com/discourse/discourse.git

# Patched Discourse bench.rb to POST results
ADD bench.rb bench.rb

# Discourse configuration files
ADD database.yml database.yml
ADD discourse.conf discourse.conf
ADD discourse_profile.dump discourse_profile.dump
ADD cache cache

ADD runner runner
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner"
