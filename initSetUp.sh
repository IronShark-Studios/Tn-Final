#! /bin/sh

echo "Creating System SSH-Key"
ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh

mkdir Archive
mkdir Projects
mkdir Media

cat ~/.ssh/id_rsa.pub
