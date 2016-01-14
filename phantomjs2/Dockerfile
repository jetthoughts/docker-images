FROM ubuntu:14.04
MAINTAINER Dmitriy Savin <its2exp@gmail.com>

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    g++ \
    flex \
    bison \
    gperf \
    perl \
    python \
    ruby \
    libsqlite3-dev \
    libfontconfig1-dev \
    libicu-dev \
    libfreetype6 \
    libssl-dev \
    libpng-dev \
    libjpeg-dev \
    libx11-dev \
    libxext-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Building phantomjs
RUN git clone --recurse-submodules git://github.com/ariya/phantomjs.git
RUN cd phantomjs && ./build.py
RUN mv /phantomjs/bin/phantomjs /usr/bin/phantomjs
RUN rm -rf /phantomjs

