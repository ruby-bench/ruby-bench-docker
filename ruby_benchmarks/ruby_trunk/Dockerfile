FROM tgxworld/ruby:0.1
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN git clone --verbose --branch trunk --single-branch https://github.com/ruby/ruby.git

ADD runner runner
ADD driver.rb driver.rb
ADD prepare_so_k_nucleotide.rb prepare_so_k_nucleotide.rb
ADD prepare_so_reverse_complement.rb prepare_so_reverse_complement.rb
ADD config.sub /ruby/tool/config.sub
ADD config.guess /ruby/tool/config.guess
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner"
