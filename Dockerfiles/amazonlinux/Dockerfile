# syntax = docker/dockerfile:1.3-labs

FROM amazonlinux:2.0.20211005.0

RUN <<EOT
set -e

ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

yum install -y \
    glibc-locale-source \
    pigz \
    procps-ng \
    tar \
    unzip \
    vim

localedef --inputfile en_US --charmap UTF-8 en_US.UTF-8
localedef --inputfile ja_JP --charmap UTF-8 ja_JP.UTF-8

amazon-linux-extras install -y \
    nginx1 \
    php7.4

yum install -y \
    php-bcmath \
    php-mbstring \
    php-opcache \
    php-pecl-memcached \
    php-pecl-redis \
    php-xml

    rm -rf /var/cache/yum

    mkdir -p /etc/nginx/certs
    /etc/pki/tls/certs/make-dummy-cert /etc/nginx/certs/localhost.pem
    openssl dhparam 2048 -out /etc/nginx/certs/dhparam.pem
EOT

RUN <<EOT
set -e

curl -L -o /usr/local/bin/composer https://getcomposer.org/download/2.1.12/composer.phar
chmod +x /usr/local/bin/composer
composer global require laravel/installer
EOT

RUN <<EOT
set -e

cd /
/root/.config/composer/vendor/bin/laravel new laravel
cd laravel
composer require laravel/jetstream
php artisan jetstream:install inertia
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install --lts node
npm install
npm run dev
EOT

WORKDIR /laravel
