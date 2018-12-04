#!/bin/bash

sudo systemctl set-default multi-user.target --force
sudo systemctl disable lightdm.service --force
sudo systemctl disable graphical.target --force
sudo systemctl disable plymouth.service --force
