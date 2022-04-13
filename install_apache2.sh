#!/bin/sh
##### 

echo ""
echo "### Install apache2 server..."
echo "Prepare..."
apt update

### search for ...
#apt search apache
## OR
#echo apache | xargs apt-cache search -

echo ""
echo "### Install..."
apt install -y apache2

echo ""
echo "### Check status..."
sleep 5
service apache2 status 
## OR 
#systemctl status apache2

echo ""
echo "### Install net-tools and check open ports..."
apt install -y net-tools
netstat -tpln 

### Here is your site
ls -ail /var/www/html

