#          Installing wordpress on ec2-server(using MySql db)
--------------------------------------------------------------------------------
#  Step 1: Setting the mysql server and creating a database and also setting the password for the root use

>Run the ./mysqldb.sh
![alt text](https://github.com/ishaq4466/wpBash/blob/master/images/mysqldb.JPG)

#  Step2:Creating the table in the sqldb
Mysql commands used:

>mysql -u root -p <br />
>show databases;<br />
>use wordpress;<br />
>create table item(id int primary key not null auto_increment,name
>char(20),price float(3,2));
![alt text](https://github.com/ishaq4466/wpBash/blob/master/images/creatingTable.JPG)

#  Step 3:Installing the wordpress on the server and connecting it to our sqldb
##  (Do modify the db name and root pswd in /var/www/html/wp-config.php)

>Run the ./wpInstall.sh
![alt text](https://github.com/ishaq4466/wpBash/blob/master/images/wpInstall.JPG)

#  Step 4: Configuring the wp-config.php
>nano /var/www/html/wp-config.php

Enter the root password and also the database name properly and then save 
the wp-config.php file
![alt text](https://github.com/ishaq4466/wpBash/blob/master/images/wpconfig.JPG)

#  Step5:Finally!!!! (http://ur-ec2-ip)
![alt text](https://github.com/ishaq4466/wpBash/blob/master/images/final.JPG)


# ANY QUERY LEASE FEEL FREE TO MAIL ME @ smartbuddy1995@gmail.com (~_^)