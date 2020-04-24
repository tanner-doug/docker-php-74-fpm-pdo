FROM php:7.4-fpm
MAINTAINER tanner.doug@gmail.com

RUN apt-get update && apt-get install -y zlib1g-dev \
    && docker-php-ext-install zip

RUN docker-php-ext-install pdo pdo_mysql
RUN apt-get update && apt-get install -y \
        libmagickwand-dev --no-install-recommends

RUN apt-get install -y libpng-dev libfreetype6-dev libjpeg62-turbo-dev \
&& docker-php-ext-configure gd --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib-dir \
&& docker-php-ext-install gd

RUN pecl install imagick && docker-php-ext-enable imagick
RUN docker-php-ext-configure opcache --enable-opcache && docker-php-ext-install opcache

EXPOSE 80