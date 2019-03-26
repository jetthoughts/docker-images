KUBE_VERSION=v1.14.0
RUBY_CHROME_VERSION=2.6.2-v1
RUBY_VERSION=2.6.2
RUBY_MAJOR=2.6
NODE_VERSION=3.11.0
BUILD_OPT=--no-cache
kubernetes: kubernetes-build kubernetes-push

kubernetes-build:
		docker build $(BUILD_OPT) --build-arg RELEASE=$(KUBE_VERSION) -t miry/kubernetes:$(KUBE_VERSION) kubernetes

kubernetes-push:
		docker push miry/kubernetes:$(KUBE_VERSION)

ruby-chrome: ruby-chrome-build ruby-chrome-push

ruby-chrome-build:
		docker build $(BUILD_OPT) --build-arg RUBY_VERSION=$(RUBY_VERSION) --build-arg RUBY_MAJOR=$(RUBY_MAJOR) --build-arg NODE_VERSION=$(NODE_VERSION) -t jetthoughts/ruby-chrome:latest -t jetthoughts/ruby-chrome:$(RUBY_CHROME_VERSION) ruby-chrome

ruby-chrome-push:
		docker push jetthoughts/ruby-chrome:$(RUBY_CHROME_VERSION)
		docker push jetthoughts/ruby-chrome:latest
