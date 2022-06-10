SHELL:=/bin/bash
REGISTRY?=figurate
IMAGE_NAME=terraform
TERRAFORM_VERSION?=1.2.2
TAGS?=$(TERRAFORM_VERSION),latest
BUILD_ARGS?=

.PHONY: all build tag push

all: build

clean:
	docker rmi $(REGISTRY)/$(IMAGE_NAME)

build:
	docker pull hashicorp/terraform:$(TERRAFORM_VERSION) && \
		docker build -t $(REGISTRY)/$(IMAGE_NAME) ${BUILD_ARGS} --build-arg TERRAFORM_VERSION=$(TERRAFORM_VERSION) --build-arg HTTP_PROXY=${http_proxy} --network=host .

tag: build
	echo $(TAGS) | tr "/," "-\n" | xargs -n1 -I % docker tag $(REGISTRY)/$(IMAGE_NAME) $(REGISTRY)/$(IMAGE_NAME):%

push: tag
	echo $(TAGS) | tr "/," "-\n" | xargs -n1 -I % docker push $(REGISTRY)/$(IMAGE_NAME):%
