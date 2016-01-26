#!/bin/bash
if [ ! -f "/var/www/html/composer.json" ]; then
git clone https://github.com/zhfnjust/flarum /var/www/html 
cd /var/www/html 
git submodule update --init --recursive
curl -sS http://install.phpcomposer.com/installer | php
mv composer.phar /usr/local/bin/composer
mkdir ~/.composer
echo "{}" > ~/.composer/composer.json
composer install --optimize-autoloader --no-dev -vvv
fi
chown -R www-data:www-data /var/www/html
echo "start server ..."
set -e

# Apache gets grumpy about PID files pre-existing
rm -f /var/run/apache2/apache2.pid

exec apache2 -DFOREGROUND
