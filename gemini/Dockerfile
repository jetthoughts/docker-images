FROM ubuntu:14.04
MAINTAINER Dmitriy Savin <its2exp@gmail.com>

WORKDIR /project

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    mysql-server \
    make \
    nodejs-legacy \
    npm \
    build-essential \
    g++ \
    flex \
    bison \
    gperf \
    perl \
    python \
    libmysqlclient-dev \
    libsqlite3-dev \
    libfontconfig1-dev \
    libicu-dev \
    libfreetype6 \
    libssl-dev \
    libpng-dev \
    libjpeg-dev \
    libreadline-dev\
    zlib1g-dev \
    libx11-dev \
    libxext-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install gemini
RUN npm install -g npm
RUN npm install -g npm
RUN npm install -g gemini

# Building phantomjs
RUN git clone --recurse-submodules git://github.com/ariya/phantomjs.git
RUN cd phantomjs && ./build.py
RUN mv /phantomjs/bin/phantomjs /usr/bin/phantomjs
RUN rm -rf /phantomjs

# Install Ruby 2.1.5
RUN wget -O ruby-2.1.5.tar.gz http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz
RUN tar -xzf ruby-2.1.5.tar.gz
RUN cd ruby-2.1.5/ && ./configure && make && make install
RUN rm -rf /ruby-2.1.5 /ruby-2.1.5.tar.gz

# Install gems
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install bundler
RUN gem install foreman

# Start project server and gemini
CMD bundle \
 && service mysql start \
 && rake db:create db:schema:load db:migrate \
 && foreman start -p 3000 web=1 \
 && bin/gemini gather spec/gemini

