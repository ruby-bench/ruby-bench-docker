FROM rubybench/ruby_releases_base:20200413.1
MAINTAINER Guo Xiang

# Required for Discourse bench
RUN apt-get update && apt-get install -y wget && \
    add-apt-repository 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update && apt-get install -y \
      postgresql-client-10 \
      tzdata brotli

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

# Discourse stable v2.4
ENV DISCOURSE_COMMIT_HASH 76b9be3f19f393a216973b791245228f2d3e92f8
ENV RAILS_ENV profile

CMD /bin/bash -l -c "./runner"
