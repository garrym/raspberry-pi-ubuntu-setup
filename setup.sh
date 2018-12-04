#!/bin/bash

# Update packages
sudo apt update -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt clean

# Install firewall and enable
sudo apt install ufw
sudo ufw enable

# Install ssh and add rule to firewall to allow it through
sudo apt install ssh
sudo ufw allow ssh

# Set ssh to start on boot
sudo update-rc.d ssh defaults

# Start the ssh daemon
sudo /etc/init.d/ssh start

