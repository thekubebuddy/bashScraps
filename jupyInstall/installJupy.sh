#!/bin/bash
rm -rf /home/ubuntu/.jupyter
cd /home/ubuntu
wget http://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh
bash Anaconda3-4.4.0-Linux-x86_64.sh -bp /home/ubuntu/anaconda3
which python /usr/bin/python
source .bashrc

jupyter notebook --generate-config
mkdir certs
cd certs
sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem


cd /home/ubuntu/.jupyter 
rm -rf jupyter_notebook_config.py
wget https://raw.githubusercontent.com/ishaq4466/flaskInstallation/master/jupyter_notebook_config.py
cd /home/ubuntu/

mkdir Notebooks
cd Notebooks

jupyter notebook



# for generating 'sha1:256.....' run below command in the shell 
# ipython
# from IPython.lib import passwd
# passwd()
# note the 'sha1:25'6......' and paste it into /home/ubuntu/.jupyter/jupyter_conf.py
# conda install opencv
# for more resouces:
# python-3-notebooks-on-aws-ec2-in-15-mostly-easy-steps
# getting-spark-python-and-jupyter-notebook-running-on-amazon-ec2
# http://rodriguezandres.github.io/2017/01/18/jupyter-aws/ 
# http://www.gallamine.com/2014/05/auto-start-ipython-notebook-server-on.html
# export PATH="/home/ubuntu/anaconda3/bin:$PATH"

