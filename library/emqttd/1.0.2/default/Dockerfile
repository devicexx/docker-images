FROM devicexx/erlang

MAINTAINER Vowstar Co., Ltd. <support@vowstar.com>

ENV EMQTTD_VERSION=1.0.2

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk --no-cache add \
        git \
        make \
    && git clone -b ${EMQTTD_VERSION} https://github.com/emqtt/emqttd.git /emqttd \
    && cd /emqttd \
    && git checkout origin/master rebar.config \
    && make && make dist \
    && mkdir /opt && mv /emqttd/rel/emqttd /opt/emqttd \
    && cd / && rm -rf /emqttd \
    && echo "#!/bin/sh" >> /etc/profile.d/emqttd.sh \
    && echo 'export PATH=$PATH:/opt/emqttd/bin' >> /etc/profile.d/emqttd.sh \
    && chmod +x /etc/profile.d/emqttd.sh \
    && apk --purge del \
        git \
        make \
    && rm -rf /var/cache/apk/*

ADD ./start.sh /opt/emqttd/start.sh

WORKDIR /opt/emqttd

# start emqttd and initial environments
CMD ["sh /opt/emqttd/start.sh"]

VOLUME ["/opt/emqttd/etc", "/opt/emqttd/data", "/opt/emqttd/plugins"]

# emqttd will occupy 1883 port for MQTT, 8883 port for MQTT(SSL), 8083 for WebSocket/HTTP, 18083 for dashboard
EXPOSE 1883 8883 8083 18083
