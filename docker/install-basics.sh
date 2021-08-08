#! /bin/bash -e

apt-get update
apt-get install -y \
        ca-certificates \
        file \
        iputils-ping \
        less \
        nano \
        rsync \
        software-properties-common \
        ssh \
        sudo \
        systemd \
        tar \
        unzip \
        vim \
        wget \

rm -rf /var/lib/apt/lists/*
