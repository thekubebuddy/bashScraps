sudo apt-get install python3-pip libapache2-mod-wsgi python3-dev
pip3 install virtualenv

#setting up the directories for flask app
rm -rf Flask /etc/apache2/sites-available/FlaskApp.conf
cd /var/www/
mkdir Flask
cd Flask
wget https://raw.githubusercontent.com/ishaq4466/flaskInstallation/master/flaskapp.wsgi
mkdir Flask
cd Flask
mkdir static templates
wget https://raw.githubusercontent.com/ishaq4466/flaskInstallation/master/__init__.py
sudo virtualenv Virtualenv

source Virtualenv/bin/activate

pip install flask
pip install flask

#python /var/www/Flask/Flask/__init__.py

cd /etc/apache2/sites-available/
wget https://raw.githubusercontent.com/ishaq4466/flaskInstallation/master/FlaskApp.conf

cd /var/www/Flask

sudo a2enmod wsgi
sudo a2ensite FlaskApp

clear

printf 'Plz change  "server-name" to your "domain_ip" \nby running command===> nano /etc/apache2/sites-available/FlaskApp.conf\n\n%.0s' {1..2}
printf 'Restart the server to see the changes\n\n service apache2 restart\n\n'
