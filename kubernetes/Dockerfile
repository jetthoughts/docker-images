# Repo: miry/kubernetes
# Build: docker build --build-arg RELEASE=v1.11.0 -t miry/kubernetes:v1.11.0 .
# Build: docker build --build-arg RELEASE=v1.10.5 -t miry/kubernetes:v1.10.5 .
FROM alpine:3.7

RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*

ARG RELEASE="v1.11.0"

RUN cd /bin \
 && wget -q https://storage.googleapis.com/kubernetes-release/release/${RELEASE}/bin/linux/amd64/kubeadm \
 && wget -q https://storage.googleapis.com/kubernetes-release/release/${RELEASE}/bin/linux/amd64/kubelet \
 && wget -q https://storage.googleapis.com/kubernetes-release/release/${RELEASE}/bin/linux/amd64/kubectl \
 && chmod +x /bin/kube*
