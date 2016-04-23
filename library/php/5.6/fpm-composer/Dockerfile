FROM alpine:edge

MAINTAINER Vowstar Co., Ltd. <support@vowstar.com>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update add \
        curl \
        php-dom \
        php-ctype \
        php-curl \
        php-fpm \
        php-gd \
        php-intl \
        php-json \
        php-mbstring \
        php-mysqlnd \
        php-opcache \
        php-pdo \
        php-pdo_mysql \
        php-posix \
        php-session \
        php-xml \
        php-phar \
        php-openssl \
        php-mcrypt \
        php-zip \
        php-mbstring \
        php-mysqli \
        php \
    && rm -rf /var/cache/apk/*

# install composer
RUN cd /usr/local/bin/ \
    && curl -sS http://packagist.cn/composer/installer | php \
    && mv composer.phar composer \
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com

