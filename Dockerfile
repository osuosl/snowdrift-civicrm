FROM almalinux:8
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

RUN dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm
RUN dnf module reset -y php
RUN dnf module install -y php:remi-8.1
RUN dnf install -y php-cli php-gd php-intl php-json php-mbstring php-mysqlnd \
    php-opcache php-pdo php-pecl-apcu php-pecl-memcached php-pecl-zip \
    php-devel php-bcmath wget unzip git patch composer

RUN sed -i -e 's/memory_limit.*/memory_limit = -1/' /etc/php.ini
