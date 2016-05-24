Alpine based EMQTT server, 87 MB total, Provide MQTT service.

Support closter, use ENV EMQTTD_MASTER_NAME=emqttd-master to tell container which MQTT server is master server,
and then link them each other. The master node must started first.
