FROM ubuntu:14.04
MAINTAINER Dmitriy Savin <dsa@jetthoughts.com>

# Install dependencies
RUN apt-get update && apt-get install -y \
             git \
             wget \
             make \
             libssl-dev \
             libreadline-dev \
             zlib1g-dev \
             build-essential \
             g++\
          && apt-get clean \
          && rm -rf /var/lib/apt/lists/*

# Install Ruby 2.1.5
RUN wget -O ruby-2.1.5.tar.gz http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz
RUN tar -xzf ruby-2.1.5.tar.gz
RUN cd ruby-2.1.5/ && ./configure && make && make install
RUN rm -rf /ruby-2.1.5 /ruby-2.1.5.tar.gz

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install bundler

