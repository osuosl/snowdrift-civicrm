FROM centos:7
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

# install PHP
RUN yum install -y https://repo.ius.io/ius-release-el7.rpm epel-release
RUN yum install -y php74-cli php74-json php74-mbstring php74-xml php74-pdo php74-opcache php74-mysqlnd php74-gd \
    php74-intl php74-pecl-zip wget unzip git236 patch

RUN sed -i -e 's/memory_limit.*/memory_limit = -1/' /etc/php.ini

# install Composer
RUN wget -q -O /usr/local/bin/composer https://getcomposer.org/download/2.2.18/composer.phar && \
    chmod +x /usr/local/bin/composer
