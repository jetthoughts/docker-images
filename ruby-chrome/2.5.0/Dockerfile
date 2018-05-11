FROM selenium/node-chrome:3.11.0
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
             curl \
          && apt-get clean \
          && rm -rf /var/lib/apt/lists/*

ARG RUBY_VERSION="2.5.1"
ARG RUBY_MAJOR="2.5"
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

RUN gem update --system \
 && gem install bundler

CMD [ "irb" ]
