
echo -e "http://dl-cdn.alpinelinux.org/alpine/v3.8/main\nhttp://dl-cdn.alpinelinux.org/alpine/v3.8/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing" > /etc/apk/repositories

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

lbu_commit

service docker start

#TODO: 