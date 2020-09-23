SHELL:=/bin/bash
REGISTRY?=figurate
TAGS?=latest,alpine
BUILD_ARGS?=

.PHONY: all build tag push

all: build

clean:
	docker rmi $(REGISTRY)/diagrams

build:
	 docker build -t $(REGISTRY)/diagrams ${BUILD_ARGS} --build-arg HTTP_PROXY=${http_proxy} --network=host .

tag:
	echo $(TAGS) | tr "/," "-\n" | xargs -n1 -I % docker tag $(REGISTRY)/diagrams $(REGISTRY)/diagrams:%

push:
	echo $(TAGS) | tr "/," "-\n" | xargs -n1 -I % docker push $(REGISTRY)/diagrams:%
