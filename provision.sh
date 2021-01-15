#! /bin/bash -e

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd ${SCRIPT_DIR}

sudo apt-get update
sudo apt-get install ansible -y

ansible-galaxy install -r ${SCRIPT_DIR}/ansible/requirements.yml

ansible-playbook \
  --connection=local \
  --inventory 127.0.0.1, \
  --limit 127.0.0.1 \
  ${SCRIPT_DIR}/ansible/playbook.yml
