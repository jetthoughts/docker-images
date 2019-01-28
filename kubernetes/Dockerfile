# Repo: miry/kubernetes
# Build: docker build --build-arg RELEASE=v1.11.7 -t miry/kubernetes:v1.11.7 .
FROM alpine:3.8

RUN apk --no-cache add \
      ca-certificates

ARG RELEASE="v1.12.5"

RUN cd /bin \
 && wget -q https://storage.googleapis.com/kubernetes-release/release/${RELEASE}/bin/linux/amd64/kubeadm \
 && wget -q https://storage.googleapis.com/kubernetes-release/release/${RELEASE}/bin/linux/amd64/kubelet \
 && wget -q https://storage.googleapis.com/kubernetes-release/release/${RELEASE}/bin/linux/amd64/kubectl \
 && chmod +x /bin/kube*
