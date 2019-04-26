# rubybench/ruby:2.6.3
FROM ubuntu:16.04
MAINTAINER Guo Xiang

ENV LANG en_US.UTF-8

RUN apt-get update
RUN apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev git curl libtool libxslt-dev libxml2-dev libpq-dev gawk curl pngcrush python-software-properties software-properties-common tasksel apache2-utils postgresql-client libffi-dev locales
RUN locale-gen en_US.UTF-8
RUN git config --global user.email "you@example.com" && \
    git config --global user.name "Your Name"

RUN git clone https://github.com/rbenv/rbenv.git /root/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc

RUN /bin/bash -l -c "rbenv install 2.6.3"
RUN /bin/bash -l -c "rbenv global 2.6.3"
