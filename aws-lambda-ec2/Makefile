SHELL:=/bin/bash
REGISTRY?=figurate
TAGS?=latest
BUILD_ARGS?=
PYTHON_VERSION=3.8

.PHONY: all build tag push

all: build

clean:
	docker rmi $(REGISTRY)/aws-lambda-ec2

build:
	 docker build -t $(REGISTRY)/aws-lambda-ec2 ${BUILD_ARGS} --build-arg PYTHON_VERSION=$(PYTHON_VERSION) \
 		--build-arg HTTP_PROXY=${http_proxy} --network=host .

tag:
	echo $(TAGS) | tr "/," "-\n" | xargs -n1 -I % docker tag $(REGISTRY)/aws-lambda-ec2 $(REGISTRY)/aws-lambda-ec2:%

push:
	echo $(TAGS) | tr "/," "-\n" | xargs -n1 -I % docker push $(REGISTRY)/aws-lambda-ec2:%
