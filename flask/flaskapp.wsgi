#!/usr/bin/python
import sys
import logging
import site
site.addsitedir('/var/www/Flask/Flask/Virtualenv/lib/python3.5/site-packages')
logging.basicConfig(stream=sys.stderr)
sys.path.insert(0,"/var/www/Flask/")

from Flask import app as application
application.secret_key = 'jh2u5y4t5vrc3yy24y2'
