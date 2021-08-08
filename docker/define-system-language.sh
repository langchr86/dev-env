#! /bin/bash -e

LANG=${1}

apt-get update
apt-get install -y locales

locale-gen "${LANG}"
echo "LANG=${LANG}" > /etc/profile.d/language.sh
