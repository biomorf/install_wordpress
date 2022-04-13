#!/bin/sh
######


echo ""
echo "### Install mysql..."
echo "Prepare..."
apt update

### search for ...
#apt search mysql
## OR
#echo mysql | xargs apt-cache search -

echo ""
echo "### Install..."
apt install -y mysql-server

echo ""
echo "### Check status..."
sleep 5
service mysql status 
## OR 
#systemctl status apache2

