FROM centos:7
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

# install PHP
RUN sed -i '/baseurl=http/s/^#//g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i '/mirrorlist=http/s/^/#/g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -ie 's/mirror.centos.org/ftp.osuosl.org\/pub/' /etc/yum.repos.d/CentOS-Base.repo
RUN yum -y install https://repo.ius.io/ius-release-el7.rpm epel-release && \
    sed -i '/baseurl=http/s/^#//g' /etc/yum.repos.d/epel.repo && \
    sed -i '/metalink=http/s/^/#/g' /etc/yum.repos.d/epel.repo && \
    sed -ie 's/download.fedoraproject.org\/pub\/epel/ftp.osuosl.org\/pub\/fedora-epel/' /etc/yum.repos.d/epel.repo
RUN yum-config-manager --enable ius-archive
RUN yum install -y php74-cli php74-json php74-mbstring php74-xml php74-pdo php74-opcache php74-mysqlnd php74-gd \
    php74-intl php74-pecl-zip wget unzip git236 patch

RUN sed -i -e 's/memory_limit.*/memory_limit = -1/' /etc/php.ini

# install Composer
RUN wget -q -O /usr/local/bin/composer https://getcomposer.org/download/2.2.18/composer.phar && \
    chmod +x /usr/local/bin/composer
