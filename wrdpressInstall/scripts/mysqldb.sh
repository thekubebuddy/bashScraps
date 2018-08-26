#!/bin/bash
yum install php-mysql php httpd mysql-server -y
service mysqld start
sleep 4
mysqladmin -uroot create mydb
#wordpress is the dataBase name
mysql_secure_installation
#mysql -u root -p

