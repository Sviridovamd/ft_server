#!/bin/bash

apt update
apt upgrade -y
apt install nginx -y

mv /tmp/wmadison.config /etc/nginx/sites-available/wmadison.config
ln -s /etc/nginx/sites-available/wmadison.config /etc/nginx/sites-enabled
rm /etc/nginx/sites-enabled/default

mkdir /etc/nginx/ssl
apt install openssl -y
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
 -keyout /etc/nginx/ssl/server.key \
 -out /etc/nginx/ssl/server.crt \
 -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=wmadison"

apt install mariadb-server -y
service mysql start
echo "CREATE DATABASE wmadison_dat;" | mysql -u root
echo "GRANT ALL ON wmadison_dat.* TO 'wmadison'@'localhost' IDENTIFIED BY '123' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

apt install php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip -y
apt install php-fpm php-mysql -y
service php7.3-fpm start

mkdir /var/www/wmadison
mv /tmp/index.html /var/www/wmadison/
echo "<?php
phpinfo();
?>" > /var/www/wmadison/info.php

apt install php-json php-mbstring -y
mkdir /var/www/wmadison/phpmyadmin && cd /var/www/wmadison/phpmyadmin
apt install wget -y
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1
mv /var/www/wmadison/phpmyadmin/config.sample.inc.php /var/www/wmadison/phpmyadmin/config.inc.php
sed -i 's/$cfg['Servers'][$i]['AllowNoPassword'] = false/$cfg['Servers'][$i]['AllowNoPassword'] = true/' config.inc.php

cd /tmp/
wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv /tmp/wordpress /var/www/wmadison/
rm -rf *.*

chmod 775 /var/www/wmadison/
chown -R www-data:www-data /var/www/wmadison/

service nginx start