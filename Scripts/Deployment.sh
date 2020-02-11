#!/bin/bash

# Update ubuntu
sudo apt-get update

# Create new user
sudo adduser wordpress

# Install Apache
sudo apt-get install apache2 apache2-utils
sudo update-rc.d apache2 defaults
sudo service apache2 restart

# Install PHP
sudo apt install php libapache2-mod-php php-mysql
php -v

read -p "Press ENTER any Key to Continue..."

# Copy dir.conf file
cd /etc/apache2/mods-enabled
sudo cp ./Scripts/dir.conf /etc/apache2/mods-enabled

# Restar Apache
sudo service apache2 restart

# Copy info.php
sudo cp ./Scripts/info.php /var/www/html

read -p "Press ENTER any Key to Continue..."

# Install Wordpress
cd ~
wget http://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz

sudo rsync -avP ~/wordpress/ /var/www/html/
cd /var/www/html/

sudo chown -R www-data:www-data *

read -p "Press ENTER any Key to Continue..."

# Continue with wordpress installation
sudo chown -R www-data:www-data /var/www/html/wp-content/uploads

cd /var/www/html/
cp wp-config-sample.php wp-config.php

# Copy wp-config.php
sudo cp ./Scripts/wp-config.php /var/www/html/wp-config.php

read -p "Press ENTER any Key to Continue..."

# Create MariaDB Database
sudo apt-get install mysql-server php7.2-mysql

sudo mysql_secure_installation
sudo mysql --host wpdbsrv02.mariadb.database.azure.com --user Usuario02@wpdbsrv02 -p < ./Scripts/createdb.sql

# Añadimos esta linea para el pluging de Azure Storage
sudo apt-get install php-xml




