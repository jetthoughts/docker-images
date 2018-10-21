KUBE_VERSION=v1.11.3
RUBY_CHROME_VERSION=2.6.0-preview2-v0
RUBY_VERSION=2.6.0-preview2
RUBY_MAJOR=2.6-rc
NODE_VERSION=3.14

kubernetes: kubernetes-build kubernetes-push

kubernetes-build:
		docker build --build-arg RELEASE=$(KUBE_VERSION) -t miry/kubernetes:$(KUBE_VERSION) kubernetes

kubernetes-push:
		docker push miry/kubernetes:$(KUBE_VERSION)

ruby-chrome: ruby-chrome-build ruby-chrome-push

ruby-chrome-build:
		docker build --build-arg RUBY_VERSION=$(RUBY_VERSION) --build-arg RUBY_MAJOR=$(RUBY_MAJOR) --build-arg NODE_VERSION=$(NODE_VERSION) -t jetthoughts/ruby-chrome:latest -t jetthoughts/ruby-chrome:$(RUBY_CHROME_VERSION) ruby-chrome

ruby-chrome-push:
		docker push jetthoughts/ruby-chrome:$(RUBY_CHROME_VERSION)
		docker push jetthoughts/ruby-chrome:latest
