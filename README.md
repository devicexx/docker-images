# Device++ docker images list

Vowstar Co.,Ltd. <support@vowstar.com>

## Index

### [EMQTTD](#use-emqttd)
[![Docker Pulls](https://img.shields.io/docker/pulls/devicexx/emqttd.svg)](https://hub.docker.com/r/devicexx/emqttd/) [![Docker Stars](https://img.shields.io/docker/stars/devicexx/emqttd.svg)](https://hub.docker.com/r/devicexx/emqttd/) [![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/vowstar/esp8266/blob/master/LICENSE)

[EMQTTD](https://hub.docker.com/r/devicexx/emqttd/) docker image is Alpine based EMQTT server, 87MB total, Provide MQTT service. 

emqttd(Erlang MQTT Broker) is a massively scalable and clusterable MQTT V3.1/V3.1.1 broker written in Erlang/OTP.
emqttd is fully open source and licensed under the Apache Version 2.0. emqttd implements both MQTT V3.1 and V3.1.1 protocol specifications, and supports WebSocket, STOMP, SockJS, CoAP and MQTT-SN at the same time.

### [ERLANG](#use-erlang)
[![Docker Pulls](https://img.shields.io/docker/pulls/devicexx/erlang.svg)](https://hub.docker.com/r/devicexx/erlang/) [![Docker Stars](https://img.shields.io/docker/stars/devicexx/erlang.svg)](https://hub.docker.com/r/devicexx/erlang/) [![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/vowstar/esp8266/blob/master/LICENSE)

[ERLANG](https://hub.docker.com/r/devicexx/erlang/) docker image is Alpine based Erlang 18.3 environment.

Erlang is a programming language used to build massively scalable soft real-time systems with requirements on high availability. Some of its uses are in telecoms, banking, e-commerce, computer telephony and instant messaging. Erlang's runtime system has built-in support for concurrency, distribution and fault tolerance.OTP is set of Erlang libraries and design principles providing middle-ware to develop these systems. It includes its own distributed database, applications to interface towards other languages, debugging and release handling tools.

### [PHP](#use-php)
[![Docker Pulls](https://img.shields.io/docker/pulls/devicexx/php.svg)](https://hub.docker.com/r/devicexx/php/) [![Docker Stars](https://img.shields.io/docker/stars/devicexx/php.svg)](https://hub.docker.com/r/devicexx/php/) [![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/vowstar/esp8266/blob/master/LICENSE)

[PHP](https://hub.docker.com/r/devicexx/php/) docker image is Alpine based Alpine php7.0, php5.6 with fpm and composer environment.

PHP is a popular general-purpose scripting language that is especially suited to web development.
Fast, flexible and pragmatic, PHP powers everything from your blog to the most popular websites in the world.


## Usage
### Install Docker
[Follow the instructions at https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)

### Run

Execute some command under this docker image

``docker run --rm -ti -v `pwd`:$(somewhere) devicexx/$(image) $(somecommand)``

#### USE EMQTTD

Get emqttd

``docker pull devicexx/emqttd``

Get specific version

``docker pull devicexx/emqttd:1.0``

Tag available

- 1.0.3
- 1.0.2
- 1.0.1
- 1.0
- latest 

Run emqttd

``docker run --rm -ti --name emqttd-s1 -p 18083:18083 -p 1883:1883 -p 8083:8083 -p 8443:8443 devicexx/emqttd``

Link emqttd as cluster

``docker run --rm -ti --name emqttd-s2 --link emqttd-s1 devicexx/emqttd``

#### USE ERLANG

Get erlang

``docker pull devicexx/erlang``

Get specific version

``docker pull devicexx/erlang:18.3``

Tag available

- 18.3
- latest 

#### USE PHP

Get PHP

``docker pull devicexx/php``

Get specific version

``docker pull devicexx/php:7.0``

Tag available

- 7.0
- 5.6
- latest 

