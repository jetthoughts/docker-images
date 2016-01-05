FROM ubuntu:15.04
MAINTAINER Michael Nikitochkin <miry.sof@gmail.com>

ADD http://downloads.mesosphere.io/master/ubuntu/15.04/mesos_0.24.1-0.2.35.ubuntu1504_amd64.deb /tmp/mesos.deb
RUN echo "deb http://repos.mesosphere.io/ubuntu/ vivid main" > /etc/apt/sources.list.d/mesosphere.list
RUN echo "deb http://apt.dockerproject.org/repo ubuntu-vivid main" > /etc/apt/sources.list.d/docker.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

RUN apt-get -y update
RUN apt-get install -y openjdk-8-jre-headless libcurl3 libsvn1 libsasl2-modules zookeeper
RUN dpkg -i /tmp/mesos.deb && rm /tmp/mesos.deb
RUN apt-get -y install marathon
RUN apt-get -y install docker-engine

