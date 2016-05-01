FROM devicexx/erlang

MAINTAINER Vowstar Co., Ltd. <support@vowstar.com>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk apk --no-cache add \
        git make \
    && clone https://github.com/emqtt/emqttd.git \
    && cd /emqttd && make && make dist \
    && mkdir /opt && mv /emqttd/rel/emqttd /opt/emqttd \
    && cd / && rm -rf /emqttd \
    && apk --purge del git make \
    && rm -rf /var/cache/apk/*
