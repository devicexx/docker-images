FROM php:7.0-fpm-alpine

# install composer
RUN cd /usr/local/bin/ \
    && curl -sS http://packagist.cn/composer/installer | php \
    && mv composer.phar composer \
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com

