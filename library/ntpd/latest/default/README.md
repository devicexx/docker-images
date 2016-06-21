# NTP service use openntp under Alpine

Vowstar Co.,Ltd. <support@vowstar.com>

[![Docker Pulls](https://img.shields.io/docker/pulls/devicexx/ntpd.svg)](https://hub.docker.com/r/devicexx/ntpd/) [![Docker Stars](https://img.shields.io/docker/stars/devicexx/ntpd.svg)](https://hub.docker.com/r/devicexx/ntpd/) [![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/vowstar/esp8266/blob/master/LICENSE)

[NTPD](https://hub.docker.com/r/devicexx/ntpd/) docker image is Alpine based ntp server. 

OpenNTPD is a FREE, easy to use implementation of the Network Time Protocol. It provides the ability to sync the local clock to remote NTP servers and can act as NTP server itself, redistributing the local clock.

OpenNTPD was primarily developed by Henning Brauer as part of the OpenBSD Project and gets released as a base component of OpenBSD every six months.

The portable version, maintained by Brent Cook, is available via periodic tarball releases. Contributions are welcome to both the OpenNTPD core and the portable build framework.

The software is freely usable and re-usable by everyone under a BSD license. The OpenBSD project sells CDs, T-shirts and posters. Sales of these items help to fund development.

### Run

Execute some command under this docker image

``docker run --rm -ti -v `pwd`:$(somewhere) devicexx/$(image) $(somecommand)``

#### USE NTPD

Get ntpd

``docker pull devicexx/ntpd``

Get specific version

``docker pull devicexx/ntpd:latest``

Tag available

- latest 

Run ntpd

``docker run --rm -ti --name ntpd -p 123:123/udp devicexx/ntpd``


