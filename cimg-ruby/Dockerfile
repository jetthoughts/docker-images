ARG RUBY_VERSION="3.1"

FROM cimg/ruby:${RUBY_VERSION}-browsers

# Install Chrome

ARG CHROME_URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

#RUN curl --silent --show-error --location --fail --retry 3 --output google-chrome.deb "${CHROME_URL}" \
# && sudo dpkg -i google-chrome.deb \
# && rm -rf google-chrome.deb \
# && sudo sed -i 's|HERE/chrome"|HERE/chrome" --disable-setuid-sandbox --no-sandbox|g' "/opt/google/chrome/google-chrome"

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
  && sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
  && sudo apt-get update \
  && sudo apt-get install -y google-chrome-stable \
  && rm -rf /var/lib/apt/lists/*
