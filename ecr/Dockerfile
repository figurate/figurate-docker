FROM amazon/aws-cli

LABEL author="Ben Fortuna <fortuna@micronode.com>"

ARG HTTP_PROXY=""

ENV https_proxy=${HTTP_PROXY}

RUN amazon-linux-extras install -y docker && yum install -y jq docker-ce && \
    yum clean all &&  rm -rf /var/cache/yum

ADD ecr.sh /

ENTRYPOINT ["/ecr.sh"]
