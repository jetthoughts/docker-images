FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install software-properties-common && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    add-apt-repository -y ppa:ethereum/ethereum-dev && \
    apt-get -y update && \
    apt-get -y install ethminer

COPY docker-entrypoint.sh /
RUN chmod 777 /docker-entrypoint.sh

ENTRYPOINT ["ethminer"]
