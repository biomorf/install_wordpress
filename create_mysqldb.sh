#!/bin/sh
#####

### create new db by sql script
sudo mysql --verbose < create_new_db.sql

### open new db
mysql -u wordpress -p wordpress

