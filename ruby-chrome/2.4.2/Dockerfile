FROM selenium/node-chrome:3.7.1
MAINTAINER Michael Nikitochkin <miry.sof@gmail.com>

USER root
# skip installing gem documentation
RUN mkdir -p /usr/local/etc \
	&& { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

# Install dependencies
RUN apt-get update && apt-get install -y \
             git \
             wget \
             make \
             libssl-dev \
             libreadline-dev \
             zlib1g-dev \
             build-essential \
             g++ \
             xvfb \
          && apt-get clean \
          && rm -rf /var/lib/apt/lists/*

ARG RUBY_VERSION="2.4.2"
ARG RUBY_MAJOR="2.4"
RUN wget -O ruby.tar.xz "https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR%-rc}/ruby-$RUBY_VERSION.tar.xz" \
  && mkdir -p /usr/src/ruby \
  && tar -xJf ruby.tar.xz -C /usr/src/ruby --strip-components=1 \
  && rm ruby.tar.xz \
  && cd /usr/src/ruby \
  && ./configure --disable-install-doc --enable-shared \
  && make -j "$(nproc)" \
  && make install \
  && rm -rf /usr/src/ruby

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN gem update --system

CMD [ "irb" ]
