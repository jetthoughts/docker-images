# cimg-ruby Dockerfile
# Builds on top of cimg/ruby:<version>-browsers and ensures Chrome is available.
# Adds labels and healthcheck for easier support.
ARG RUBY_VERSION="3.4"
FROM cimg/ruby:${RUBY_VERSION}-browsers

LABEL maintainer="JetThoughts <dev@jetthoughts.com>"
LABEL org.opencontainers.image.source="https://github.com/jetthoughts/docker-images"
LABEL org.opencontainers.image.description="CircleCI compatible Ruby image with Chrome pre-installed"

# Install Chrome
ARG CHROME_URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
  && sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
  && sudo apt-get update -qq --fix-missing \
  && sudo apt-get install -qq google-chrome-stable \
  && sudo sed -i 's|HERE/chrome"|HERE/chrome" --disable-gpu --disable-setuid-sandbox --no-sandbox|g' "/opt/google/chrome/google-chrome" \
  && sudo apt-get clean \
  && sudo apt-get autoclean \
  && sudo apt-get autoremove \
  && sudo rm -rf /var/cache/apt/archives/* \
  && sudo rm -rf /tmp/* /var/tmp/* \
  && sudo truncate -s 0 /var/log/*log

# Add a healthcheck for easier support
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
  CMD ruby -v || exit 1

# Documentation:
# - To build: docker build --build-arg RUBY_VERSION=3.4 -t jetthoughts/cimg-ruby:3.4-chrome .
# - To run:   docker run --rm -it jetthoughts/cimg-ruby:3.4-chrome bash

# For support, see: https://github.com/jetthoughts/docker-images/issues

