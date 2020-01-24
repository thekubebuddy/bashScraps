Table of Content
=================

1. [Monitoring with supervisord]()
2. [Setting different versions of bins]




# 1. Monitoring with supervisord

# 2. Setting different versions of binaries
```
# run whereis command to see where the different same binaries is located.
sudo readlink -f $(whereis python)
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 2
sudo update-alternatives --config python
sudo update-alternatives  --set python /usr/bin/python3.6
```




