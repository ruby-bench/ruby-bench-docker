FROM tgxworld/ruby:0.1
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN git clone --verbose https://github.com/rails-bench/discourse.git
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "gem install facter"

ADD database.yml database.yml
ADD discourse.conf discourse.conf
ADD discourse_profile.dump discourse_profile.dump
ADD bench.rb bench.rb
ADD runner runner
RUN chmod 755 runner

ENV RAILS_MASTER 1

CMD /bin/bash -l -c "./runner && cd discourse && ruby script/bench.rb -m -n"
