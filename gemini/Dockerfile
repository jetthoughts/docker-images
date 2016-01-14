FROM jetthoughts/phantomjs2:latest
MAINTAINER Dmitriy Savin <its2exp@gmail.com>

# Install dependencies
RUN apt-get update && apt-get install -y \
    nodejs-legacy \
    npm \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install gemini
RUN npm install -g npm
RUN npm install -g npm
RUN npm install -g gemini

WORKDIR /project

ENTRYPOINT ["bin/gemini"]

