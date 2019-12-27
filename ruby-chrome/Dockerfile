# Image: jetthoughts/ruby-chrome

ARG NODE_VERSION=3.141

FROM selenium/node-chrome:${NODE_VERSION}
LABEL maintainer="Michael Nikitochkin <miry.sof@gmail.com>"

USER root

ARG RUBY_VERSION="2.7.0"
ARG RUBY_MAJOR="2.7"

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN mkdir -p /usr/local/etc \
 && { \
  echo 'install: --no-document'; \
  echo 'update: --no-document'; \
 } >> /usr/local/etc/gemrc \
 && apt-get update \
# Online Games Bot Engine

A simple bot for auto-building and gain resources via missions. Tested on Linux and MacOS.
Supports Lords and Knights 2020 version.

# Lords and Knights

Website: https://lordsandknights.com
Naive bot solution to optimize your nights and days.
Spent more time on what is matter, than do a routine job.

## Features

### Automate buildings

Do continuous buildings in any order, that you specify. Feel free to use my strategy from [config/servers.yml.example](config/servers.yml.example).

### Research

Do research in **Library** or **University**. Dumb approach - the first available research.

### Missions

Continuously send troops to missions. **WARNING**: Disable it manually , if you have a war or require troops for something.
 && apt-get install -y \
                    git \
                    wget \
                    make \
                    libssl-dev \
                    libreadline-dev \
                    zlib1g-dev \
                    build-essential \
                    g++ \
                    xvfb \
                    curl \
 && apt-get clean \
 && wget -O ruby.tar.xz "https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR%-rc}/ruby-$RUBY_VERSION.tar.xz" \
 && mkdir -p /usr/src/ruby \
 && tar -xJf ruby.tar.xz -C /usr/src/ruby --strip-components=1 \
 && rm ruby.tar.xz \
 && cd /usr/src/ruby \
 && ./configure --disable-install-doc --enable-shared \
 && make -j "$(nproc)" \
 && make install \
 && gem update --system \
 && rm -rf /usr/src/ruby \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /var/lib/cache/* \
 && rm -rf /var/lib/log/*.log \
 && rm -rf /var/lib/log/apt/*.log

CMD [ "irb" ]
