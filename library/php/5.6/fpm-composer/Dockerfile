FROM alpine:edge

MAINTAINER Vowstar Co., Ltd. <support@vowstar.com>

ENV PHP_FPM_LISTEN               9000
ENV PHP_DATE_TIMEZONE            UTC
ENV PHP_MEMORY_LIMIT             128M
ENV PHP_MAX_FILE_UPLOADS         20
ENV PHP_UPLOAD_MAX_FILE_SIZE     2M
ENV PHP_POST_MAX_SIZE            8M

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update add \
        curl \
        php5-dom \
        php5-ctype \
        php5-curl \
        php5-fpm \
        php5-gd \
        php5-iconv \
        php5-intl \
        php5-json \
        php5-opcache \
        php5-pdo \
        php5-pdo_mysql \
        php5-posix \
        php5-xml \
        php5-phar \
        php5-openssl \
        php5-mcrypt \
        php5-zip \
        php5-mysqli \
        php5-mysql \
        php5 \
        && \
    rm -rf /var/cache/apk/* && \
    ln -s /usr/bin/php5 /usr/bin/php && \
    ln -s /usr/sbin/php-fpm7 /usr/sbin/php-fpm && \
    sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/php-fpm.conf && \
    sed -i -e "s/listen\s*=\s*127.0.0.1:9000/listen = ${PHP_FPM_LISTEN}/g" /etc/php5/php-fpm.conf && \
    sed -i "s|;date.timezone =.*|date.timezone = ${PHP_DATE_TIMEZONE}|" /etc/php5/php.ini && \
    sed -i "s|memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|" /etc/php5/php.ini && \
    sed -i "s|max_file_uploads =.*|max_file_uploads = ${PHP_MAX_FILE_UPLOADS}|" /etc/php5/php.ini && \
    sed -i "s|upload_max_filesize =.*|upload_max_filesize = ${PHP_UPLOAD_MAX_FILE_SIZE}|" /etc/php5/php.ini && \
    sed -i "s|post_max_size =.*|post_max_size = ${PHP_POST_MAX_SIZE}|" /etc/php5/php.ini

# install composer
RUN cd /usr/local/bin/ && \
    curl -sS http://packagist.cn/composer/installer | php && \
    mv composer.phar composer && \
    composer config -g repo.packagist composer https://packagist.phpcomposer.com


WORKDIR /var/www

# Expose volumes
VOLUME ["/var/www"]

# Expose ports
EXPOSE 9000

# Entry point
ENTRYPOINT ["/usr/bin/php-fpm"]
