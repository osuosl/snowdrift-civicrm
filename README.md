First update the composer.json file to what you want and then do the following:

```
docker run -it --rm -v $(pwd):/w -w /w centos:7

# Inside the container
yum install -y https://repo.ius.io/ius-release-el7.rpm \
  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y php73-cli php73-json php73-mbstring php73-xml php73-pdo \
  php73-opcache php73-mysqlnd php73-gd wget
wget -O /usr/local/bin/composer https://getcomposer.org/download/1.10.7/composer.phar
chmod +x /usr/local/bin/composer
composer update
```
