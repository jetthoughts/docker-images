KUBE_VERSION=v1.11.3

kubernetes: kubernetes-build kubernetes-push

kubernetes-build:
		docker build --build-arg RELEASE=$(KUBE_VERSION) -t miry/kubernetes:$(KUBE_VERSION) kubernetes

kubernetes-push:
		docker push miry/kubernetes:$(KUBE_VERSION)
