FROM tgxworld/ruby_releases_base
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN git clone --verbose --depth 1 https://github.com/ruby/ruby.git

ADD runner runner
ADD driver.rb driver.rb
ADD bm_io_select3.rb bm_io_select3.rb
ADD bm_so_nsieve_bits.rb bm_so_nsieve_bits.rb
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner"
