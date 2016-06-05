# Device++ docker images list

## Index

### EMQTTD
[![Docker Pulls](https://img.shields.io/docker/pulls/devicexx/emqttd.svg)](https://hub.docker.com/r/devicexx/emqttd/) [![Docker Stars](https://img.shields.io/docker/stars/devicexx/emqttd.svg)](https://hub.docker.com/r/devicexx/emqttd/) [![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/vowstar/esp8266/blob/master/LICENSE)

[EMQTTD](https://hub.docker.com/r/devicexx/emqttd/) docker image is Alpine based EMQTT server, 87MB total, Provide MQTT service. 

emqttd(Erlang MQTT Broker) is a massively scalable and clusterable MQTT V3.1/V3.1.1 broker written in Erlang/OTP.
emqttd is fully open source and licensed under the Apache Version 2.0. emqttd implements both MQTT V3.1 and V3.1.1 protocol specifications, and supports WebSocket, STOMP, SockJS, CoAP and MQTT-SN at the same time.

### ERLANG
[![Docker Pulls](https://img.shields.io/docker/pulls/devicexx/erlang.svg)](https://hub.docker.com/r/devicexx/erlang/) [![Docker Stars](https://img.shields.io/docker/stars/devicexx/erlang.svg)](https://hub.docker.com/r/devicexx/erlang/) [![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/vowstar/esp8266/blob/master/LICENSE)

[ERLANG](https://hub.docker.com/r/devicexx/erlang/) docker image is Alpine based Erlang 18.3 environment.

Erlang is a programming language used to build massively scalable soft real-time systems with requirements on high availability. Some of its uses are in telecoms, banking, e-commerce, computer telephony and instant messaging. Erlang's runtime system has built-in support for concurrency, distribution and fault tolerance.OTP is set of Erlang libraries and design principles providing middle-ware to develop these systems. It includes its own distributed database, applications to interface towards other languages, debugging and release handling tools.

## Usage
### Install Docker
[Follow the instructions at https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)

### Run

Execute some command under this docker image

``docker run --rm -ti -v `pwd`:$(somewhere) devicexx/$(image) $(somecommand)``

#### EMQTTD

For example, run emqttd

``docker run --rm -ti -v devicexx/emqttd``


