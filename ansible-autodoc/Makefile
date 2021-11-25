SHELL:=/bin/bash
include .env

.PHONY: all build tag push

all: build

clean:
	docker rmi $(REGISTRY)/ansible-autodoc

build:
	 docker build -t $(REGISTRY)/ansible-autodoc ${BUILD_ARGS} --build-arg HTTP_PROXY=${http_proxy} --network=host .

tag:
	echo $(TAGS) | tr "/," "-\n" | xargs -n1 -I % docker tag $(REGISTRY)/ansible-autodoc $(REGISTRY)/ansible-autodoc:%

push:
	echo $(TAGS) | tr "/," "-\n" | xargs -n1 -I % docker push $(REGISTRY)/ansible-autodoc:%
