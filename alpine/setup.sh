# Unzip and copy the Alpine files to a FAT32 formatted SD card ensuring you have chosen
# the right architecture for the Raspberry Pi model you are using. I found the following
# works:
# Raspberry Pi 1 - Couldn't find a working version
# Raspberry Pi 2 - armv7
# Raspberry Pi 3 - armv7 or aarch64

# Plug the SD card into the Raspberry Pi and plug in the power. A login prompt should appear.
# Enter 'root' as the username, a password should not be required

# Run alpine-setup.sh and follow the instructions

# After setup is complete
# Edit /etc/apk/repositories and ensure the following lines are uncommented:
# http://<mirror>/alpine/<version>/main
# http://<mirror>/alpine/<version>/community
# http://<mirror>/alpine/edge/testing

apk update
apk upgrade

apk add sudo
apk add curl

apk add ufw
ufw default deny incoming
ufw allow ssh
ufw enable

apk add docker
rc-update add docker boot
service docker start

apk add openssh
rc-update add sshd
/etc/init.d/sshd start

lbu_commit

# Setting up SSH by enabling root login

# WARNING: The following method is not recommended and will lower the security of your Raspberry Pi.
# DO NOT DO THIS IF YOU ARE UNAWARE OF THE CONSEQUENCES OF ENABLING ROOT LOGIN VIA SSH!

# Edit the /etc/ssh/sshd_config file and make sure the following two lines are uncommented and are set to 'yes'
# PasswordAuthentication yes
# PermitRootLogin yes

If you aren't too concerned with security navigate edit /etc/ssh/sshd_config and uncomment the line labeled:
# PasswordAuthentication yes
# Otherwise configure sshd in a secure manner
