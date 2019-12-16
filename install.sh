#! /bin/sh


# SSH
# Generate key
ssh-keygen -t rsa -b 4096 -C info.lanvink@gmail.com -A
# Add the key to the ssh-agent
ssh-add ~/.ssh/id_rsa

# Git
apt-get -y install git


# Copy config files
cp ./config/xinitrc ~/.xinitrc
