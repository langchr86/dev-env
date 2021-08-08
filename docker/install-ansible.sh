#! /bin/bash -e

apt-get update
apt-get install -y ansible
rm -rf /var/lib/apt/lists/*
