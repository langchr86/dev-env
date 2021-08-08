#! /bin/bash -e

VERSION=${1}

apt-get update
apt-get install -y gcc-${VERSION} g++-${VERSION}

rm -rf /var/lib/apt/lists/*

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-${VERSION} 60 \
  --slave /usr/bin/cc cc /usr/bin/gcc-${VERSION} \
  --slave /usr/bin/g++ g++ /usr/bin/g++-${VERSION} \
  --slave /usr/bin/c++ c++ /usr/bin/g++-${VERSION}
