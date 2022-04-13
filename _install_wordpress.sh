#!/bin/sh
#####

echo ""
echo "### Install wordpress..."

echo "### Prepare..."
echo "### Install LAMP..."
source ./install_apache2.sh
source ./install_php.sh
source ./install_mysql.sh
apt update

### search for ...
#apt search apache
## OR
#echo apache | xargs apt-cache search -

echo ""
echo "### Install additional PHP extensions..."
echo "from https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-on-ubuntu-20-04-with-a-lamp-stack"
sudo apt install -y php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
sudo apt install -y php-mysql

echo ""
echo "### Create new mysql database..."
source ./create_mysqldb.sh


echo ""
echo "### Install wordpress..."
wget https://wordpress.org/latest.tar.gz
sudo tar -xf latest.tar.gz -C /var/www/
#sudo chown -R www-data: /var/www/wordpress
sudo chown -R root: /var/www/wordpress

echo ""
echo "Enable wordpress..."
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/001-wordpress.conf

sudo sed -i "s/\/var\/www\/html/\
\/var\/www\/wordpress/g" \
	/etc/apache2/sites-available/001-wordpress.conf

sudo sed -i "/DocumentRoot/a\
	\ \
	<Directory \/var\/www\/wordpress>\n\
	    AllowOverride All\n\
	</Directory>\n\
  \n" \
	/etc/apache2/sites-available/001-wordpress.conf

sudo ln -s /etc/apache2/sites-available/001-wordpress.conf /etc/apache2/sites-enabled/001-wordpress.conf
sudo rm -rf /etc/apache2/sites-enabled/000-default.conf

sudo service apache2 restart
sleep 2
service apache2 status

echo ""
echo "Configure wordpress..."
sudo cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
sudo sed -i "s/database_name_here/\
wordpress/g" \
        /var/www/wordpress/wp-config.php
sudo sed -i "s/username_here/\
wordpress/g" \
        /var/www/wordpress/wp-config.php
sudo sed -i "s/password_here/\
wordpre5s/g" \
        /var/www/wordpress/wp-config.php

echo ""
echo "###!!! DON'T FORGET to copy and paste authentication unique keys and salt from 
https://api.wordpress.org/secret-key/1.1/salt/ to wp-config.php"

