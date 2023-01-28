DROP SCHEMA IF EXISTS planetscale_dev;
CREATE SCHEMA planetscale_dev;
USE planetscale_dev;

CREATE USER 'planetscale'@'localhost' IDENTIFIED BY 'planetscale';
GRANT ALL PRIVILEGES ON *.* TO 'planetscale'@'%' WITH GRANT OPTION;
