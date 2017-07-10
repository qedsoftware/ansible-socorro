# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'
dir = File.dirname(File.expand_path(__FILE__))
vconfig = YAML::load_file("#{dir}/vars.yml")

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.hostname = "vagrant"

  config.vm.network :forwarded_port, host: 5601, guest: 5601     # Kibana
  config.vm.network :forwarded_port, host: 5000, guest: 5000     # Socorro Collector

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider :virtualbox do | vb |
    vb.customize ["modifyvm", :id, "--memory", ENV.fetch('VAGRANT_RAM', 2048)]
    vb.customize ["modifyvm", :id, "--cpus", ENV.fetch('VAGRANT_CPUS', 2)]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.config_file = "ansible.cfg"
    ansible.playbook = "stage.yml"
    ansible.inventory_path = "./inventory/vagrant"
    ansible.limit = ["vagrant"]
    #ansible.extra_vars = {
    #    repository: 'vagrant',
    #}
    # ansible.verbose = "vvvv"
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

end

load "Vagrantfile.local" if File.exists?("Vagrantfile.local")
