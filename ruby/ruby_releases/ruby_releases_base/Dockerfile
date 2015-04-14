FROM ubuntu:14.04
MAINTAINER Guo Xiang "tgx_world@hotmail.com"

RUN apt-get update
RUN apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev git curl libtool libxslt-dev libxml2-dev libpq-dev gawk curl pngcrush python-software-properties software-properties-common tasksel apache2-utils postgresql-client libffi-dev

RUN git clone --depth 1 https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone --depth 1 https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
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
RUN /bin/bash -l -c "rbenv install 2.0.0-p643"

# See https://github.com/sstephenson/ruby-build/issues/526#issuecomment-37933242
RUN /bin/bash -l -c "curl -fsSL https://gist.github.com/mislav/a18b9d7f0dc5b9efc162.txt | rbenv install --patch 2.1.0"
RUN /bin/bash -l -c "curl -fsSL https://gist.github.com/mislav/a18b9d7f0dc5b9efc162.txt | rbenv install --patch 2.1.1"
RUN /bin/bash -l -c "rbenv install 2.1.2"
RUN /bin/bash -l -c "rbenv install 2.1.3"
RUN /bin/bash -l -c "rbenv install 2.1.4"
RUN /bin/bash -l -c "rbenv install 2.1.5"
RUN /bin/bash -l -c "rbenv install 2.1.6"

RUN /bin/bash -l -c "rbenv install 2.2.0"
RUN /bin/bash -l -c "rbenv install 2.2.1"
RUN /bin/bash -l -c "rbenv install 2.2.2"

# Install Github Ruby with per method cache
RUN git clone -b 2.2 --single-branch https://github.com/github/ruby.git githubruby
ADD config.sub /githubruby/tool/config.sub
ADD config.guess /githubruby/tool/config.guess
RUN apt-get install -y ruby
RUN cd githubruby && git reset --hard cd7d20399f5a8d4e924444943ea898d20e24c657 && autoconf && ./configure --prefix=/root/.rbenv/versions/githubruby-2.2.0-dev --disable-install-doc && make && make install
