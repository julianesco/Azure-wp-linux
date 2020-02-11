CREATE DATABASE wordpressdb;
CREATE USER 'wordpressuser02'@'%' IDENTIFIED BY 'test-password02';
GRANT ALL PRIVILEGES ON wordpressdb.* TO 'wordpressuser02'@'%';
FLUSH PRIVILEGES;