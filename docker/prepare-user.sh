#! /bin/bash -e

USER=${1}
GROUP=${2:-${USER}}
CUSTOM_UID=${3:-1000}
CUSTOM_GID=${4:-1000}

groupadd -o -g ${CUSTOM_GID} ${GROUP}
useradd --no-log-init -d "/home/${USER}" -u ${CUSTOM_UID} -g ${CUSTOM_GID} -m -s /bin/bash ${USER}

# define password
echo -e "${USER}\n${USER}" | passwd ${USER}

# make sudo not use a password
echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
