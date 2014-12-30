FROM tgxworld/ruby_releases_base
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN git clone --verbose --depth 1 https://github.com/ruby/ruby.git

ADD runner runner
ADD driver.rb driver.rb
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner"
