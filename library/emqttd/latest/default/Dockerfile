FROM devicexx/erlang

MAINTAINER Vowstar Co., Ltd. <support@vowstar.com>

ENV EMQTTD_VERSION=master

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk --no-cache add \
        git \
        make \
    && git clone -b ${EMQTTD_VERSION} https://github.com/emqtt/emqttd.git /emqttd \
    && cd /emqttd && make && make dist \
    && mkdir /opt && mv /emqttd/rel/emqttd /opt/emqttd \
    && cd / && rm -rf /emqttd \
    && echo "#!/bin/sh" >> /opt/emqttd/start.sh \
    && echo "/opt/emqttd/bin/emqttd start && sleep 10 && tail -f /opt/emqttd/log/*" >> /opt/emqttd/start.sh \
    && chmod +x /opt/emqttd/start.sh \
    && apk --purge del \
        git \
        make \
    && rm -rf /var/cache/apk/*

ENV PATH=${PATH}:/opt/emqttd/bin

WORKDIR /opt/emqttd

ENTRYPOINT /opt/emqttd/bin/emqttd_ctl

# start emqttd
CMD ["/opt/emqttd/start.sh"]

VOLUME ["/opt/emqttd/etc", "/opt/emqttd/data", "/opt/emqttd/plugins"]

# emqttd will occupy 1883 port for MQTT, 8883 port for MQTT(SSL), 8083 for WebSocket/HTTP, 18083 for dashboard
EXPOSE 1883 8883 8083 18083
