FROM centos:7
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

RUN yum install -y https://repo.ius.io/ius-release-el7.rpm epel-release && \
    yum install -y php73-cli php73-json php73-mbstring php73-xml php73-pdo php73-opcache php73-mysqlnd php73-gd wget \
        unzip git && \
    sed -i -e 's/memory_limit.*/memory_limit = -1/' /etc/php.ini && \
    wget -q -O /usr/local/bin/composer https://getcomposer.org/download/1.10.7/composer.phar && \
    chmod +x /usr/local/bin/composer
