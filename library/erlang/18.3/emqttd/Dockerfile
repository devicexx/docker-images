FROM devicexx/erlang

MAINTAINER Vowstar Co., Ltd. <support@vowstar.com>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --no-cache add \
        git make \
    && git clone https://github.com/emqtt/emqttd.git \
    && cd /emqttd && make && make dist \
    && mkdir /opt && mv /emqttd/rel/emqttd /opt/emqttd \
    && cd / && rm -rf /emqttd \
    && echo "#!/bin/bash" >> /opt/emqttd/start.sh \
    && echo "/opt/emqttd/bin/emqttd start && sleep 10 && tail -f --retry /opt/emqttd/log/*" >> /opt/emqttd/start.sh \
    && chmod +x /opt/emqttd/start.sh \
    && apk --purge del git make \
    && rm -rf /var/cache/apk/*

EXPOSE 1883 8883 18083

VOLUME ["/opt/emqttd/etc", "/opt/emqttd/data", "/opt/emqttd/plugins"]

CMD ["/opt/emqttd/start.sh"]
