Table of Content
=================

1. [Setting different versions of bins](#1-setting-different-versions-of-binaries)
2. [virtual envs in python](#2-setting-up-virtual-envs-in-python)
3. [Mysql on Ubuntu](#3-mysql-on-ubuntu-1804hosting-a-mysql-server-and-exposing-as-a-service)
4. [SSH config file sample](#4-ssh-config-file-sample)
5. Process manangers for linux:
    * Systemd service in linux 
    * monit
    * supervisord
6. Adding user and enabling the SSH(On Ubuntu-GCE)




## 1. Setting different versions of binaries
```
# run whereis command to see where the different same binaries is located.
sudo readlink -f $(whereis python)
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 2
sudo update-alternatives --config python
sudo update-alternatives  --set python /usr/bin/python3.6
```

## 2. Setting up virtual envs in python 
```
# Installing the pip
apt install python3-pip
py -m pip install --upgrade pip

pip install virtualenv

# creation of virtualenv
python -m virtualenv vennv1
python -m venv venv2 # for python3 
# activating the venv
source bin/activate

export AIRFLOW_HOME=~/airflow

pip install apache-airflow django

# deactivating the virtualenv
deactivate
```

## 3. Mysql on Ubuntu 18.04(Hosting a mysql server and exposing as a service)

Installing mysql-server and allow the OS user to use "mysql" client

```
sudo apt-get update
sudo apt-get install mysql-server -y
sudo mysql_secure_installation
sudo systemctl status mysql.service
sudo systemctl restart mysql.service

# for installing the client

sudo apt-get update && apt install mysql-client -y

# for allowing mysql login for non-root users
mysql -u root -p
use mysql;
SELECT User, Host, plugin FROM mysql.user;
CREATE USER 'user1'@'localhost' IDENTIFIED BY '<user-passwd>';
UPDATE user SET plugin='auth_socket' WHERE User='user1';
FLUSH PRIVILEGES;
exit;

CREATE DATABASE sample_db1;
use sample_db1;
create table sample_table ( id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY ,full_names VARCHAR(150) , gender VARCHAR(6))

```

Allowing the db access from other machines/ip too through creating a user
```
# change the bind address in mysql.conf file:

/etc/mysql/mysqld/mysql.conf
bind_addres=0.0.0.0

# create a user and allow access to it from external ip's 
mysql -u root -p

## SELECT User, Host, plugin FROM mysql.user\G;
# Creating a user 
CREATE USER 'user1'@'localhost' IDENTIFIED BY '<user-passwd>';
GRANT ALL PRIVILEGES ON *.* TO 'user1'@'%' IDENTIFIED BY '<user-passwd>';
FLUSH PRIVILEGES;
exit;
```

Access the mysql db from the client machine
```
mysql --host <ip-addr-of-mysql-instance> -u <user-name> -p
```



Installing LAMP stack on ubuntu
```
sudo apt install apache2 -y
sudo apt install php libapache2-mod-php php-mysql -y

sudo su
vi /var/www/html/index.php
<?php
phpinfo();
?>

```



## 4. SSH config file sample
```
Host <hostname>
    HostName <ip-addr> 
    User <username>
    Port 22
    IdentityFile <path-for-.pem-file> 
```

```
sudo chown -R www-data:www-data *
```


## 5. Process Management & monitoring in linux

### 5.1. Systemd Service Daemon process

```
# Step 1. Create a script which needs to be converted into servce
# In our case, webserver is the sample script which we want to create it as a service
./webserver

# Step 2. Copying that "webserver" script to the "/usr/local/bin/webserver"

# Step 3. Creating a service file in the "systemd" folder
sudo su 
cat >> /etc/systemd/system/webserver.service<<-EOF
[Unit]
Description=webserver daemon
After=network.target  #postgresql.service mysql.service
#Wants=postgresql.service mysql.service
[Service]
EnvironmentFile=/etc/environment
User=root
Group=root
Type=simple
ExecStart= /usr/local/bin/webserver
Restart=on-failure
RestartSec=5s
PrivateTmp=true
[Install]
WantedBy=multi-user.target
EOF


# Step4. Restart the daemon and enable the "webserver service" 
sudo systemctl daemon-reload
sudo systemctl enable webserver.service
sudo systemctl start webserver.service

# check the status for the service
sudo service webserver status # stop, restart can also be used

```

For watching the logs for our **webserver service** 

```
journalctl -f -u webserver  # webserver-> service name
```

### 5.2 Processes with monit
* A very powerfull process management & monitoring utility in linux



Reference:
```
https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6
https://www.tecmint.com/how-to-install-and-setup-monit-linux-process-and-services-monitoring-program/
https://medium.com/@shahbaz.ali03/run-apache-airflow-as-a-service-on-ubuntu-18-04-server-b637c03f4722
```



6. Adding user and enabling the SSH(On Ubuntu-GCE)

```bash
#1. User creation:
sudo useradd -d /home/ubuntu -m ubuntu

#2  Set the passwd for the 'ubuntu' user
sudo passwd ubuntu 

#3 set the 'PasswordAuthentication' flag for allowing the passwd auth.
sudo vi /etc/ssh/sshd_config
PasswordAuthentication yes 

#4 restart the sshd service
sudo systemctl restart sshd

#5 swich to the ubuntu user
sudo su - ubuntu

#6 create the key files for the ubuntu user with all of the default setting
ssh-keygen

# 7. list the created key files
ll ~/.ssh/
```

>Note: Restricitive firewall rules should be in place for having access on Port:22 
