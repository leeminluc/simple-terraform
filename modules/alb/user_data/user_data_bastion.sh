#!/bin/bash
sudo perl -pi -e 's/^#?Port 22$/Port 6522/' /etc/ssh/sshd_config
sudo service sshd restart || service ssh restart
