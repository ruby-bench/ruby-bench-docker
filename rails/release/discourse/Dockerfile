FROM rubybench/ruby:2.6.3
MAINTAINER Guo Xiang

# wget required for Discourse bench
RUN apt-get update && apt-get install -y wget && \
    add-apt-repository 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update && apt-get install -y \
      postgresql-client-10 \
      tzdata

RUN git clone --branch stable --single-branch --verbose https://github.com/discourse/discourse.git
RUN git clone --branch master --single-branch https://github.com/ruby-bench/ruby-bench-suite.git

# Discourse configuration files
ADD database.yml database.yml
ADD discourse.conf discourse.conf
ADD profile_db_generator.rb profile_db_generator.rb 
ADD discourse_profile.dump discourse_profile.dump
ADD cache cache

ADD runner runner
RUN chmod 755 runner

ENV RAILS_ENV profile

CMD /bin/bash -l -c "./runner"
