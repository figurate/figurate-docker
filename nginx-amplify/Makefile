SHELL:=/bin/bash
REGISTRY?=figurate
NGINX_VERSION?=stable
TAGS?=$(NGINX_VERSION)
BUILD_ARGS?=

.PHONY: all build tag push

all: build

clean:
	docker rmi $(REGISTRY)/nginx-amplify

build:
	 docker build -t $(REGISTRY)/nginx-amplify ${BUILD_ARGS} --build-arg NGINX_VERSION=$(NGINX_VERSION) --build-arg HTTP_PROXY=${http_proxy} --network=host .

tag:
	echo $(TAGS) | tr "/," "-\n" | xargs -n1 -I % docker tag $(REGISTRY)/nginx-amplify $(REGISTRY)/nginx-amplify:%

push:
	echo $(TAGS) | tr "/," "-\n" | xargs -n1 -I % docker push $(REGISTRY)/nginx-amplify:%
