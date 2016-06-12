# Ghost-zh

Vowstar Co.,Ltd. <support@vowstar.com>

[![Docker Pulls](https://img.shields.io/docker/pulls/devicexx/ghost-zh.svg)](https://hub.docker.com/r/devicexx/ghost-zh/) [![Docker Stars](https://img.shields.io/docker/stars/devicexx/ghost-zh.svg)](https://hub.docker.com/r/devicexx/ghost-zh/) [![Image Layers](https://imagelayers.io/badge/devicexx/ghost-zh:latest.svg)](https://imagelayers.io/?images=devicexx/ghost-zh:latest) [![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/vowstar/esp8266/blob/master/LICENSE)

[GHOST-ZH](https://hub.docker.com/r/devicexx/ghost-zh/) docker image is Ghost with Chinese language pack. Source code from http://www.ghostchina.com

![Ghost Screenshot](https://cloud.githubusercontent.com/assets/120485/6626466/6dae46b2-c8ff-11e4-8c7c-8dd63b215f7b.jpg)



### Run

Execute some command under this docker image

``docker run --rm -ti -v `pwd`:$(somewhere) devicexx/$(image) $(somecommand)``

#### USE GHOST-ZH

Get ghost-zh

``docker pull devicexx/ghost-zh``

Get specific version

``docker pull devicexx/ghost-zh:0.7.4``

Tag available

- 0.7.4
- latest 

Run with development method, using port 2368

``docker run -d --restart=always --name dxx-blog -e "NODE_ENV=development" -v `pwd`/content:/var/lib/ghost -p 2368:2368 ghost:latest``

Run with production method, using port 2368

``docker run -d --restart=always --name dxx-blog -e "NODE_ENV=production" -v `pwd`/content:/var/lib/ghost -p 2368:2368 ghost:latest``


