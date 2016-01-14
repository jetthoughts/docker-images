FROM jetthoughts/ruby-2.1.5:latest
MAINTAINER Dmitriy Savin <its2exp@gmail.com>

RUN apt-get update && apt-get install -y \
    zip \
    phantomjs \
    mysql-server \
    libmysqlclient-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /project

CMD bundle \
 && service mysql start \
 && rake db:create db:schema:load db:migrate \
 && rake db:test:prepare \
 && rspec

