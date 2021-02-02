dev-env
=======

This is a `vagrant` controlled `virtualbox` VM which runs `ubuntu` and some development tools on top.
This is my personal main development machine.

A rough overview of all available tools is available in the [playbook](ansible/playbook.yml).


Quick start
-----------

To use the VM it is useful to deploy his own ssh public key.
Like that we can connect via ssh and use agent and X forwarding.
This can be done by adding a corresponding file in OpenSSL format to `ansible/roles/ssh/files`
and mention this file in the ssh line in the [playbook](ansible/playbook.yml).
Create the VM after that with `vagrant up` or let ansible run again with `vagrant provision`.

Additional documentation can be found in [docs](docs).
