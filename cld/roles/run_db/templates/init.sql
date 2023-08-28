USE mysql;
FLUSH PRIVILEGES ;
GRANT ALL ON *.* TO 'root'@'%' identified by '{{  MYSQL_PASSWORD  }}' WITH GRANT OPTION ;
GRANT ALL ON *.* TO 'root'@'localhost' identified by '{{  MYSQL_PASSWORD  }}' WITH GRANT OPTION ;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('{{  MYSQL_PASSWORD  }}') ;
DROP DATABASE IF EXISTS test ;
FLUSH PRIVILEGES ;
CREATE DATABASE IF NOT EXISTS `wordpress` CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL ON `wordpress`.* to 'wordpress'@'%' IDENTIFIED BY '{{  MYSQL_PASSWORD  }}';
CREATE USER 'afaraji'@'%' IDENTIFIED BY '{{  MYSQL_PASSWORD  }}';
GRANT SELECT ON `wordpress`.* TO 'afaraji'@'%';
FLUSH PRIVILEGES;
