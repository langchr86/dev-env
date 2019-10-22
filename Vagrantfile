# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_version = "20190905.0.0"

  # prerequisites: vagrant plugin install vagrant-disksize
  config.disksize.size = '16GB'

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provider "virtualbox" do |vb|
    vb.name = "prcpp"
    vb.memory = "4096"
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--vram", "64"]
    vb.customize ["modifyvm", :id, "--spec-ctrl", "on"]
  end

  config.vm.hostname = "prcpp"
  config.vm.network "forwarded_port", guest: 22, host: 2222

  # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "/vagrant/ansible/playbook.yml"
    ansible.galaxy_role_file = "/vagrant/ansible/requirements.yml"
  end

end
