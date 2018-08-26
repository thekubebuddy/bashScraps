#!/bin/bash
yum update -y
yum install httpd php php-mysql stress -y
service httpd start
chkconfig httpd on
echo "<html><h1>Hello World </h1></html>" >> /var/www/html/index.html
cd /var/www/html 
wget http://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
cp -rf wordpress/* /var/www/html 
rm -rf wordpress latest.tar.gz
chmod -R 755 wp-content
chown -R apache.apache wp-content
wget https://s3.ap-south-1.amazonaws.com/mumbaiwebsite2018/wp-config.php
sleep 5
service httpd restart

