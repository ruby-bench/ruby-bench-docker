FROM tgxworld/ruby:0.1
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN git clone https://github.com/discourse/discourse.git
WORKDIR discourse

RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "gem install facter"

ENV RAILS_MASTER 1

ADD database.yml discourse/config/database.yml
ADD discourse.conf discourse/config/discourse.conf
ADD runner.rb discourse/runner.rb

CMD /bin/bash -l -c "ruby runner.rb && ruby script/bench.rb"
