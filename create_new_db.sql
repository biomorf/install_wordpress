-- create new db
CREATE database wordpress;
-- DROP DATAbase wordpress;

-- create db user and password
-- create user wordpress@'*'  gives access for any address
CREATE USER wordpress@'localhost' identified by 'wordpre5s';

-- grant permissions
GRANT ALL on wordpress.* TO 'wordpress'@'localhost';

-- show db 
SHOW DATABASES;

