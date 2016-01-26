FROM daocloud.io/php:5.6-apache

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
#RUN curl -sS http://install.phpcomposer.com/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN  ln -s  /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
VOLUME /var/www/html
WORKDIR /var/www/html
#RUN git clone https://github.com/zhfnjust/flarum /var/www/html && \
#    cd /var/www/html && \
#    git submodule update --init --recursive
#RUN composer install --optimize-autoloader --no-dev -vvv
#RUN chown -R www-data:www-data /var/www/html
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
expose 80
