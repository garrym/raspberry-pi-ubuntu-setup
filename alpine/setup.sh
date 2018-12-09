
# Edit /etc/apk/repositories to enable the community and test repositories
sed 's/#http:\/\/mirror.clarkson.edu\/alpine\/v3\.8\/community/http:\/\/mirror.clarkson.edu\/alpine\/v3\.8\/community/' /etc/apk/repositories
sed 's/#http:\/\/mirror.clarkson.edu\/alpine\/edge\/testing/http:\/\/mirror.clarkson.edu\/alpine\/edge\/testing/' /etc/apk/repositories

apk update
apk upgrade
lbu_commit

apk add sudo
apk add ufw
apk add curl

# Install docker
apk add docker
rc-update add docker boot
service docker start