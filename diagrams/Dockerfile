FROM python:3-alpine

LABEL author="Ben Fortuna <fortuna@micronode.com>"

ARG HTTP_PROXY=""

ENV https_proxy=${HTTP_PROXY}

RUN apk update && apk upgrade
RUN apk add --no-cache --update graphviz ttf-freefont

COPY requirements.txt /tmp

RUN pip3 --no-cache-dir install -r /tmp/requirements.txt

WORKDIR /work
