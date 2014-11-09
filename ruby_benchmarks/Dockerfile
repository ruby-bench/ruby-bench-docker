FROM ubuntu:14.04
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN apt-get update
RUN apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev git curl

RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> .bashrc

RUN /bin/bash -c "rbenv install 2.1.4"
RUN /bin/bash -c "rbenv global 2.1.4"

RUN git clone https://github.com/ruby/ruby.git
WORKDIR ruby

CMD /bin/bash -l -c "ruby benchmark/run.rb --ruby=ruby -r"
