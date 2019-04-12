read -p "Enter username of account to create: " username

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

# Update packages to latest versions
apk update
apk upgrade

# Add basic tools
apk add sudo
apk add curl

# Install firewall and block everything but SSH
apk add ufw
ufw default deny incoming
ufw allow ssh
ufw enable

# Add SSH
apk add openssh
rc-update add sshd

# Add user, set password and enable terminal login
apk add shadow
addgroup -S $username
adduser -S $username
passwd $username
usermod -s /bin/ash garry

# (INSECURE) Allow password authentication via SSH
sed -i -e 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
echo "AllowedUsers $username" >> /etc/ssh/sshd_config

# Start SSH
/etc/init.d/sshd start

echo "You should now be able to access the terminal via the following command:
      ssh $username@<ipaddress>"

# Enable login for the new user
# Edit /etc/passwd and change /bin/nologin to /bin/ash

lbu_commit

# Add Docker and set to start at boot
apk add docker
rc-update add docker boot
service docker start
