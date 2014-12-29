FROM ubuntu:14.04
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN apt-get update
RUN apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev git curl libtool libxslt-dev libxml2-dev libpq-dev gawk curl pngcrush python-software-properties software-properties-common tasksel apache2-utils postgresql-client libffi-dev

RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# Pick the last 3 patches
RUN /bin/bash -l -c "rbenv install 1.9.3-p547"
RUN /bin/bash -l -c "rbenv install 1.9.3-p550"
RUN /bin/bash -l -c "rbenv install 1.9.3-p551"

RUN /bin/bash -l -c "rbenv install 2.0.0-p576"
RUN /bin/bash -l -c "rbenv install 2.0.0-p594"
RUN /bin/bash -l -c "rbenv install 2.0.0-p598"

# See https://github.com/sstephenson/ruby-build/issues/526#issuecomment-37933242
RUN /bin/bash -l -c "curl -fsSL https://gist.github.com/mislav/a18b9d7f0dc5b9efc162.txt | rbenv install --patch 2.1.0"
RUN /bin/bash -l -c "curl -fsSL https://gist.github.com/mislav/a18b9d7f0dc5b9efc162.txt | rbenv install --patch 2.1.1"
RUN /bin/bash -l -c "rbenv install 2.1.2"
RUN /bin/bash -l -c "rbenv install 2.1.3"
RUN /bin/bash -l -c "rbenv install 2.1.4"
RUN /bin/bash -l -c "rbenv install 2.1.5"

RUN /bin/bash -l -c "rbenv install 2.2.0"

RUN git clone --verbose --depth 1 https://github.com/ruby/ruby.git

ADD runner runner
ADD driver.rb driver.rb
ADD prepare_so_k_nucleotide.rb prepare_so_k_nucleotide.rb
ADD prepare_so_reverse_complement.rb prepare_so_reverse_complement.rb
RUN chmod 755 runner

CMD /bin/bash -l -c "./runner"
