#! /bin/bash -e

VERSION=${1}
BUILD=${2}

mkdir /tmp/cmake
cd /tmp/cmake
wget https://cmake.org/files/v${VERSION}/cmake-${VERSION}.${BUILD}-linux-x86_64.sh
mkdir /opt/cmake
sh cmake-${VERSION}.${BUILD}-linux-x86_64.sh --prefix=/opt/cmake --skip-license
ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
cd /tmp
rm -rf /tmp/cmake
