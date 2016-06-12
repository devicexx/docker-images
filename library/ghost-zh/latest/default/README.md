# Ghost-zh

Vowstar Co.,Ltd. <support@vowstar.com>

[![Docker Pulls](https://img.shields.io/docker/pulls/devicexx/ghost-zh.svg)](https://hub.docker.com/r/devicexx/ghost-zh/) [![Docker Stars](https://img.shields.io/docker/stars/devicexx/ghost-zh.svg)](https://hub.docker.com/r/devicexx/ghost-zh/) [![Image Layers](https://imagelayers.io/badge/devicexx/ghost-zh:latest.svg)](https://imagelayers.io/?images=devicexx/ghost-zh:latest) [![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/vowstar/esp8266/blob/master/LICENSE)

[GHOST-ZH](https://hub.docker.com/r/devicexx/ghost-zh/) docker image is Ghost with Chinese language pack. Source code from http://www.ghostchina.com

![Ghost Screenshot](https://cloud.githubusercontent.com/assets/120485/6626466/6dae46b2-c8ff-11e4-8c7c-8dd63b215f7b.jpg)



## Run Image

Execute some command under this docker image

``docker run --rm -ti -v `pwd`:$(somewhere) devicexx/$(image) $(somecommand)``

## USE GHOST-ZH

Get ghost-zh

``docker pull devicexx/ghost-zh``

Get specific version

``docker pull devicexx/ghost-zh:0.7.4``

Tag available

- 0.7.4
- latest 

Run with development method, using port 2368

``docker run -d --restart=always --name dxx-blog -e "NODE_ENV=development" -v `pwd`/content:/var/lib/ghost -p 2368:2368 devicexx/ghost-zh:latest``

Run with production method, using port 2368

``docker run -d --restart=always --name dxx-blog -e "NODE_ENV=production" -v `pwd`/content:/var/lib/ghost -p 2368:2368 devicexx/ghost-zh:latest``

## CONFIG

These config below could use environment settings.

You can use ``-e`` to run docker or use environment section in docker-compose.

Extra settings you can config via config.js. A volume must mount to ``/var/lib/ghost`` before you do this.

### Running mode
Notice: If not set NODE_ENV, production will active by docker.

#### Production mode
```
- NODE_ENV=production

```

#### Development mode
```
- NODE_ENV=development

```

### Define blog URL
```
- GHOST_URL=http://blog.devicexx.com
```

### Mail settings
Notice: If GHOST_MAIL_HOST is not set, mail setting will not appeared in config.js. GHOST_MAIL_SECURE is true or false. true is for SSL, false is for non-SSL. Only support SMTP settings.
```
- GHOST_MAIL_HOST=smtp.devicexx.com
- GHOST_MAIL_SECURE=true
- GHOST_MAIL_PORT=465
- GHOST_MAIL_USERNAME=ghost@yourdomain.com
- GHOST_MAIL_PASSWORD=changeme
- GHOST_MAIL_FROM="ghost@yourdomain.com"
```

### Database settings
Notice: Default database is sqlite3.

Databases supported:
- sqlite3
- mysql
- pg

#### sqlite3 example:
```
- GHOST_DATABASE_CLIENT=sqlite3
- GHOST_SQLITE_FILENAME=ghost.db

```

#### mysql example:
```
- GHOST_DATABASE_CLIENT=mysql
- GHOST_MYSQL_HOST=localhost
- GHOST_MYSQL_USER=ghost
- GHOST_MYSQL_PASSWORD=changeme
- GHOST_MYSQL_DATABASE=ghost
```

#### pg example:
```
- GHOST_DATABASE_CLIENT=pg
- GHOST_PG_HOST=localhost
- GHOST_PG_USER=ghost
- GHOST_PG_PASSWORD=changeme
- GHOST_PG_DATABASE=ghost
```

### Storage settings
Notice: If not set GHOST_STORAGE_PROVIDER, storage setting will not appeared in config.js.

Storage provider supported:
- local
- oss
- qiniu
- upyun

``local`` means storage all images or pictures in your local server.

#### oss example
Aliyun OSS service
```
GHOST_STORAGE_PROVIDER=oss
GHOST_OSS_BUCKET="your-bucket-name"
GHOST_OSS_ACCESS_KEY="changeme"
GHOST_OSS_SECRET_KEY="changeme"
GHOST_OSS_ENDPOINT="http://oss-cn-hangzhou.aliyuncs.com"
GHOST_OSS_URL="http://your-bucket-name.oss-cn-hangzhou.aliyuncs.com"
```

#### qiniu example
QiNiu storage service
```
GHOST_STORAGE_PROVIDER=qiniu
GHOST_QN_BUCKET="your-bucket-name"
GHOST_QN_ACCESS_KEY="changeme"
GHOST_QN_SECRET_KEY="changeme"
GHOST_QN_URL="http://your-cdn.qiniudn.com"
```

#### upyun example
UPYun storage service
```
GHOST_STORAGE_PROVIDER=upyun
GHOST_UPYUN_BUCKET="your-bucket-name"
GHOST_UPYUN_USERNAME="changeme"
GHOST_UPYUN_PASSWORD="changeme"
GHOST_UPYUN_URL="http://your-bucket-name.b0.upaiyun.com"
```

### Extra settings

GoogleFonts, Gravatar is default off, more settings you can set in config.js. A volume must mount to ``/var/lib/ghost`` before you do this.

More configuration please visit http://support.ghost.org/config/