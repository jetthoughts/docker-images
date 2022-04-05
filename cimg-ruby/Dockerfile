FROM cimg/ruby:3.1-browsers

# Install Chrome

ARG CHROME_URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

RUN (curl --silent --show-error --location --fail --retry 3 --output google-chrome.deb "${CHROME_URL}") && \
    (sudo dpkg -i google-chrome.deb) && \
    (rm -rf google-chrome.deb && sudo rm -rf /var/lib/apt/lists/*)  && \
    sudo sed -i 's|HERE/chrome"|HERE/chrome" --disable-setuid-sandbox --no-sandbox|g' "/opt/google/chrome/google-chrome"
