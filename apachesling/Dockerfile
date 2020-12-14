ARG SLING_VERSION=latest
FROM apache/sling:${SLING_VERSION}

LABEL author="fortuna@micronode.com"

HEALTHCHECK CMD wget -O- localhost:8080/system/health.txt?httpStatus=CRITICAL:503
