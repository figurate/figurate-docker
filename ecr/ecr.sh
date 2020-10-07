#!/usr/bin/env bash

function usage() {
  cat << EOF

USAGE: $0 <version|login|pull|push>
EOF
}

function version() {
  aws --version
}

function ecr_login() {
   aws ecr get-login-password \
              --region ${AWS_DEFAULT_REGION} \
          | docker login \
              --username AWS \
              --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com

#  `aws ecr get-authorization-token --no-include-email`
}

function ecr_pull() {
  ecr_login && \
    docker pull "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/$IMAGE:$TAG"
}

function ecr_push() {
  ecr_login && \
    echo "$TAGS" | tr "/," "-\n" | xargs -n1 -I % docker tag "$IMAGE:$TAG" "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/$IMAGE:%" && \
    echo "$TAGS" | tr "/," "-\n" | xargs -n1 -I % docker push "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/$IMAGE:%"
}

AWS_ACCOUNT_ID=$(aws sts get-caller-identity | jq -r '.Account')
IMAGE=${2:-}
TAG=${3:-latest}
TAGS=${4:-latest}

case "$1" in
	version) 			version;;
	login) 			  ecr_login;;
	pull) 			  ecr_pull;;
	push) 			  ecr_push;;
	*)				    usage;;
esac
