#! /bin/sh

echo "Creating System SSH-Key"
mkdir ~/.ssh
ssh-keygen -t rsa -b 4096 -N "" -f /home/xin/.ssh/id_rsa

mkdir ~/Archive
mkdir ~/Projects
mkdir ~/Media

cat ~/.ssh/id_rsa.pub
