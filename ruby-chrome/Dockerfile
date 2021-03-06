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
