ARG RUBY_VERSION="3.4"

FROM cimg/ruby:${RUBY_VERSION}-browsers

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
