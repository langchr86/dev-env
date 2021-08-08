#! /bin/bash -e

apt-get update
apt-get install -y openssh-server
rm -rf /var/lib/apt/lists/*

mkdir -p /var/run/sshd
