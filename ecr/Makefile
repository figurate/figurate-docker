SHELL:=/bin/bash
REGISTRY?=figurate
TAGS?=latest
BUILD_ARGS?=

RUNARGS=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

.PHONY: all build tag push

all: build

clean:
	docker rmi $(REGISTRY)/ecr

build:
	 docker build -t $(REGISTRY)/ecr ${BUILD_ARGS} --build-arg HTTP_PROXY=${http_proxy} --network=host .

tag:
	echo $(TAGS) | tr "/," "-\n" | xargs -n1 -I % docker tag $(REGISTRY)/ecr $(REGISTRY)/ecr:%

push:
	echo $(TAGS) | tr "/," "-\n" | xargs -n1 -I % docker push $(REGISTRY)/ecr:%

run:
	docker run --rm -it -v "${PWD}:/aws" -v "${HOME}/.aws:/root/.aws" -v "/var/run/docker.sock:/var/run/docker.sock" \
		-e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) $(REGISTRY)/ecr $(RUNARGS)
