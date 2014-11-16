FROM ubuntu:14.04
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN apt-get update
RUN apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev git curl libtool libxslt-dev libxml2-dev libpq-dev gawk curl pngcrush python-software-properties software-properties-common tasksel apache2-utils postgresql-client

RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> .bashrc

RUN /bin/bash -c "rbenv install 2.1.4"
RUN /bin/bash -c "rbenv global 2.1.4"

RUN git clone https://github.com/discourse/discourse.git
WORKDIR discourse

RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "gem install facter"

ENV RAILS_MASTER 1

ADD database.yml discourse/config/database.yml
ADD discourse.conf discourse/config/discourse.conf
ADD runner.rb discourse/runner.rb

CMD /bin/bash -l -c "ruby runner.rb && ruby script/bench.rb"
