FROM tgxworld/ruby_releases_base
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

# Required for Discourse bench
RUN apt-get install wget

RUN git clone --verbose https://github.com/rails-bench/discourse.git

# Patched Discourse bench.rb to POST results
ADD bench.rb bench.rb

# Discourse configuration files
ADD database.yml database.yml
ADD discourse.conf discourse.conf
ADD discourse_profile.dump discourse_profile.dump

ADD runner runner
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner"
