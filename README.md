Table of Content
=================

1. [Setting different versions of bins](#2-Setting-different-versions-of-binaries)
2. [virtual envs in python](#3-Setting-up-virtual-envs-in-python)
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
# 3. Monitoring with supervisord
```

```






