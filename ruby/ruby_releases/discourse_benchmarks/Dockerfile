FROM rubybench/ruby_releases_base:0.7
MAINTAINER Guo Xiang

# Required for Discourse bench
RUN apt-get install wget

RUN git clone --branch stable --single-branch --verbose https://github.com/discourse/discourse.git
RUN git clone --branch master --single-branch https://github.com/ruby-bench/ruby-bench-suite.git

# Discourse configuration files
ADD database.yml database.yml
ADD discourse.conf discourse.conf
ADD discourse_profile.dump discourse_profile.dump
ADD cache cache

ADD runner runner
RUN chmod 755 runner

# Discourse stable v1.2.4
ENV DISCOURSE_COMMIT_HASH 4e187334b3c2485737a44c76e04eda0c22c1d40e
ENV RAILS_ENV profile

CMD /bin/bash -l -c "./runner"
