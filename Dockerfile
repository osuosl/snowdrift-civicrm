FROM almalinux:8
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

RUN dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm
RUN dnf module reset -y php
RUN dnf module install -y php:remi-8.1
RUN dnf install -y php-cli php-json php-mbstring php-xml php-pdo php-opcache php-mysqlnd php-gd \
    php-intl php-pecl-zip php-pecl-igbinary php-pecl-msgpack php-pecl-memcached php-pecl-apcu \ 
    php-pear php-fedora-autoloader php-process php-sodium php wget unzip git patch
RUN dnf --enablerepo=remi install -y php-nikic-php-parser4

RUN sed -i -e 's/memory_limit.*/memory_limit = -1/' /etc/php.ini

# install Composer
RUN wget -q -O /usr/local/bin/composer https://getcomposer.org/download/2.2.18/composer.phar && \
    chmod +x /usr/local/bin/composer
