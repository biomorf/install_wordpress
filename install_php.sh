#!/bin/sh
#####

echo ""
echo "### Install php..."
echo "Prepare..."
apt update

### search for ...
#apt search php
## OR
#echo php | xargs apt-cache search -

echo ""
echo "### Install..."
apt install -y libapache2-mod-php

