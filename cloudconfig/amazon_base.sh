#!/bin/bash

# # Disable Selinux
# setenforce 0

# Stop and disable some services
systemctl stop postfix
systemctl disable postfix

systemctl stop rpcbind
systemctl disable rpcbind
systemctl mask rpcbind
systemctl stop rpcbind.socket
systemctl disable rpcbind.socket

# Clean yum database
yum clean all

# Update Amazon
yum update -y

# Install some Amazon packages
yum install mc -y

# Base config Amazon
cd /
wget wget https://twink-lab.s3.amazonaws.com/cloudconfig/amazon_files/base.tar.gz
tar -zxvf base.tar.gz
systemctl restart sshd
rm -f base.tar.gz

# Install EPEL repository
amazon-linux-extras install epel -y

# Install some packages
yum install htop -y
yum install iftop -y
yum install nmon -y

# Reboot SentOS
#init 6

#
