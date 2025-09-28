php dockerfile

```bash

FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    autoconf \
    g++ \
    make \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN docker-php-ext-install pdo_mysql

COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /var/www/html

```

xdebug.ini

```

```
zend_extension=xdebug

[xdebug]
xdebug.mode=debug,develop
xdebug.start_with_request=yes
xdebug.client_host=host.docker.internal
xdebug.client_port=9003




