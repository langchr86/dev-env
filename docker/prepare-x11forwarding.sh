#! /bin/bash -e

apt-get update
apt-get install -y xbase-clients x11-common
rm -rf /var/lib/apt/lists/*

# enable remote X forwarding in sshd
echo "X11Forwarding yes" >> /etc/ssh/sshd_config
echo "X11UseLocalhost no" >> /etc/ssh/sshd_config

# correct terminal and colors
printf "export TERM=screen\n \
        export LS_COLORS=\"di=0;35\"\n" \
    > /etc/profile.d/x11_forwarding.sh
