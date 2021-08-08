#! /bin/bash -e

apt-get update
apt-get install -y \
        autoconf \
        automake \
        ccache \
        gdb \
        git \
        make \
        pkg-config \
        strace \
        tcpdump \
        valgrind \

rm -rf /var/lib/apt/lists/*
