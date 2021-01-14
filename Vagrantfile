# -*- mode: ruby -*-
# vi: set ft=ruby :

vm_name = "dev-env"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "20200825.0.0"

  config.vagrant.plugins = ["vagrant-disksize"]
  config.disksize.size = '16GB'

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provider "virtualbox" do |vb|
    vb.name = vm_name
    vb.memory = "4096"
    vb.cpus = 3
    vb.customize ["modifyvm", :id, "--vram", "64"]
    vb.customize ["modifyvm", :id, "--spec-ctrl", "on"]

    # See: https://github.com/hashicorp/vagrant/issues/11777
    vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
    vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
  end

  config.vm.hostname = vm_name
  config.vm.synced_folder "./ansible/", "/vagrant/ansible"

  # remove not yet supported ansible ppa
  config.vm.provision "shell",
    inline: "rm -f /etc/apt/sources.list.d/ansible-ansible-focal.list"

  config.vm.provision "ansible_local" do |ansible|
    ansible.install_mode = "pip"
    ansible.playbook = "/vagrant/ansible/playbook.yml"
    ansible.galaxy_role_file = "/vagrant/ansible/requirements.yml"
  end

end
