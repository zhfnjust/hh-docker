FROM php:5.6-apache

ADD sources.list /etc/apt/sources.list
RUN apt-get update -y && \
    apt-get install -y git curl libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev
RUN docker-php-ext-install mbstring && \
    docker-php-ext-install zip && \
    docker-php-ext-install pdo && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install iconv mcrypt && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer
RUN composer config -g repo.packagist composer http://packagist.phpcomposer.com
RUN git clone https://github.com/flarum/flarum /var/www/html && \
    cd /var/www/html && \
    git submodule update --init --recursive
WORKDIR /var/www/html
RUN composer install --prefer-dist --optimize-autoloader
RUN chown -R www-data:www-data /var/www/html
expose 80
