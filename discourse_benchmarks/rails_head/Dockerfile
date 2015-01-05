FROM tgxworld/ruby:0.1
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN git clone --verbose --branch master --single-branch https://github.com/rails-bench/discourse.git

# Required for Discourse bench
RUN apt-get install wget

# For faster Bundle install
RUN /bin/bash -l -c "echo "gem: --no-ri --no-rdoc" > ~/.gemrc"

RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "gem install facter"

ADD database.yml database.yml
ADD discourse.conf discourse.conf
ADD discourse_profile.dump discourse_profile.dump
ADD bench.rb bench.rb
ADD Gemfile_master.lock Gemfile_master.lock
ADD cache cache
ADD runner runner
RUN chmod 755 runner

ENV RAILS_MASTER 1

CMD /bin/bash -l -c "./runner"
