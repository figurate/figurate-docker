ARG NGINX_VERSION=latest
FROM nginx:${NGINX_VERSION}

LABEL author="Ben Fortuna <fortuna@micronode.com>"

ARG HTTP_PROXY=""

ENV https_proxy=${HTTP_PROXY}

#RUN apk update && apk upgrade && apk add --no-cache --update curl
#RUN yum install -y curl && yum clean all &&  rm -rf /var/cache/yum
RUN apt-get update && apt-get install -y curl gnupg lsb-release

RUN curl -fs http://nginx.org/keys/nginx_signing.key | apt-key add -
#RUN wget -q -O - \
#    http://nginx.org/keys/nginx_signing.key | apt-key add -

RUN codename=`lsb_release -cs` && \
    os=`lsb_release -is | tr '[:upper:]' '[:lower:]'` && \
    echo "deb http://packages.amplify.nginx.com/${os}/ ${codename} amplify-agent" > \
    /etc/apt/sources.list.d/nginx-amplify.list

RUN apt-get update && apt-get install -y nginx-amplify-agent

#RUN curl -sS -L -O https://github.com/nginxinc/nginx-amplify-agent/raw/master/packages/install.sh
#  - API_KEY="${NginxAmplifyKey}" AMPLIFY_HOSTNAME="${NginxHostname}" sh ./install.sh -y

COPY ./entrypoint.sh /entrypoint.sh

# TO set/override API_KEY and AMPLIFY_IMAGENAME when starting an instance:
# docker run --name my-nginx1 -e API_KEY='..effc' -e AMPLIFY_IMAGENAME="service-name" -d nginx-amplify

ENTRYPOINT ["/entrypoint.sh"]