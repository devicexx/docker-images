FROM alpine:edge

MAINTAINER Vowstar Co., Ltd. <support@vowstar.com>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --no-cache add \
        nodejs \
    && rm -rf /var/cache/apk/*

