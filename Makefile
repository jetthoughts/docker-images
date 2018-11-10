KUBE_VERSION=v1.12.2
RUBY_CHROME_VERSION=2.6.0-preview3-v1
RUBY_VERSION=2.6.0-preview3
RUBY_MAJOR=2.6-rc
NODE_VERSION=3.141.5

kubernetes: kubernetes-build kubernetes-push

kubernetes-build:
		docker build --no-cache --build-arg RELEASE=$(KUBE_VERSION) -t miry/kubernetes:$(KUBE_VERSION) kubernetes

kubernetes-push:
		docker push miry/kubernetes:$(KUBE_VERSION)

ruby-chrome: ruby-chrome-build ruby-chrome-push

ruby-chrome-build:
		docker build --no-cache --build-arg RUBY_VERSION=$(RUBY_VERSION) --build-arg RUBY_MAJOR=$(RUBY_MAJOR) --build-arg NODE_VERSION=$(NODE_VERSION) -t jetthoughts/ruby-chrome:latest -t jetthoughts/ruby-chrome:$(RUBY_CHROME_VERSION) ruby-chrome

ruby-chrome-push:
		docker push jetthoughts/ruby-chrome:$(RUBY_CHROME_VERSION)
		docker push jetthoughts/ruby-chrome:latest
