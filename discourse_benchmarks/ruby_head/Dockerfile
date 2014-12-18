FROM tgxworld/ruby:0.1
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN git clone --verbose https://github.com/discourse/discourse.git
RUN git clone --verbose https://github.com/ruby/ruby.git

ADD database.yml discourse/config/database.yml
ADD discourse.conf discourse/config/discourse.conf
ADD runner runner
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner && ruby discourse/script/bench.rb"
