#!/bin/bash

sudo perl -pi -e 's/^#?Port 22$/Port 6522/' /etc/ssh/sshd_config
sudo service sshd restart || service ssh restart
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2
sudo aws s3 cp s3://skillup-s3-jon.julian/index.html /var/www/html/index.html --region us-east-2
