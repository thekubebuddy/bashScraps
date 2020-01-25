Table of Content
=================

1. [Setting different versions of bins](#1-setting-different-versions-of-binaries)
2. [virtual envs in python](#2-setting-up-virtual-envs-in-python)
3. [Systemd service in linux](#1-Monitoring-with-supervisord)




# 1. Setting different versions of binaries
```
# run whereis command to see where the different same binaries is located.
sudo readlink -f $(whereis python)
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 2
sudo update-alternatives --config python
sudo update-alternatives  --set python /usr/bin/python3.6
```

# 2. Setting up virtual envs in python 
```
# Installing the pip
apt install python3-pip
pip install virtualenv
py -m pip install --upgrade pip

# creation of virtualenv
python -m virtualenv vennv1
python -m venv venv2
source bin/activate
export AIRFLOW_HOME=~/airflow
pip install apache-airflow django

# deactivating the virtualenv
deactivate
```
# 3. [Systemd Service creation(Daemon process)](https://medium.com/@shahbaz.ali03/run-apache-airflow-as-a-service-on-ubuntu-18-04-server-b637c03f4722)


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
For watching the logs for the webserver service 
```
journalctl -f -u webserver  # webserver-> service name
```




