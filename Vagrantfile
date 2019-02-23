# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  # prerequisites
  # vagrant plugin install vagrant-disksize
  config.disksize.size = '12GB'

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provider "virtualbox" do |vb|
    vb.name = "prcpp"
    vb.memory = "4096"
	vb.cpus = 4
  end

  config.vm.hostname = "prcpp"

  config.vm.synced_folder "ansible/", "/home/vagrant/ansible"

  # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.become = true
    ansible.playbook = "/home/vagrant/ansible/playbook.yml"
  end

end
