#! /bin/bash -e

apt-get update
apt-get install -y docker.io docker-compose

rm -rf /var/lib/apt/lists/*

printf "export DOCKER_HOST=tcp://docker:2376\n \
        export DOCKER_CERT_PATH=/certs/client\n \
        export DOCKER_TLS_VERIFY=1\n" \
    > /etc/profile.d/dockerd.sh
