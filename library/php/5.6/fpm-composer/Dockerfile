FROM alpine:latest

MAINTAINER Vowstar Co., Ltd. <support@vowstar.com>

RUN apk --update add \
        php-dom \
        php-ctype \
        php-curl \
        php-fpm \
        php-gd \
        php-iconv \
        php-intl \
        php-json \
        php-opcache \
        php-pdo \
        php-pdo_mysql \
        php-posix \
        php-xml \
        php
    && rm -rf /var/cache/apk/*

# install composer
RUN cd /usr/local/bin/ \
    && curl -sS http://packagist.cn/composer/installer | php \
    && mv composer.phar composer \
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com

