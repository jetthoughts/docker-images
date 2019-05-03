# Repo: miry/kubernetes
# Build: docker build --build-arg RELEASE=v1.11.7 -t miry/kubernetes:v1.11.7 .
FROM alpine:edge

RUN apk --no-cache add \
      bash \
      ca-certificates \
      curl \
      git \
      openssh-client

ARG RELEASE="v1.14.1"

RUN cd /bin \
 && wget -q https://storage.googleapis.com/kubernetes-release/release/${RELEASE}/bin/linux/amd64/kubeadm \
 && wget -q https://storage.googleapis.com/kubernetes-release/release/${RELEASE}/bin/linux/amd64/kubelet \
 && wget -q https://storage.googleapis.com/kubernetes-release/release/${RELEASE}/bin/linux/amd64/kubectl \
 && chmod +x /bin/kube*
