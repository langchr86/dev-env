#! /bin/bash -e

VERSION=${1}

cd /tmp
mkdir clion
cd clion
wget "https://download-cdn.jetbrains.com/cpp/CLion-${VERSION}.tar.gz"
tar xvzf CLion-*.tar.gz -C /opt/
rm -rf /tmp/clion

printf 'alias clion="/opt/clion-%s/bin/clion.sh &>/dev/null"' "${VERSION}" > /etc/profile.d/clion.sh
