# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
apt-get install unzip -y
# Install Nomad
curl -o nomad.zip https://releases.hashicorp.com/nomad/1.1.0/nomad_1.1.0_linux_amd64.zip && unzip nomad.zip && rm nomad.zip
mv nomad /usr/local/bin/

mkdir -p /opt/nomad/data/plugins

nomad agent -config=/tmp/config.hcl > /dev/null 2>&1 &
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.define :nomadserver do |nomadserver|
    nomadserver.vm.box = "bento/ubuntu-20.04"
    nomadserver.vm.network :private_network, ip: "10.0.0.10"
    nomadserver.vm.provision "file", source: "server.hcl", destination: "/tmp/config.hcl"
    nomadserver.vm.hostname = "nomadserver"
    nomadserver.vm.provision "shell", inline: $script
  end

  config.vm.define :nomadclient1 do |nomadclient1|
    nomadclient1.vm.box = "bento/ubuntu-20.04"
    nomadclient1.vm.network :private_network, ip: "10.0.0.11"
    nomadclient1.vm.hostname = "nomadclient1"
    nomadclient1.vm.provision "file", source: "client-1.hcl", destination: "/tmp/config.hcl"
    nomadclient1.vm.provision "shell", inline: $script
  end

  config.vm.define :nomadclient2 do |nomadclient2|
    nomadclient2.vm.box = "bento/ubuntu-20.04"
    nomadclient2.vm.network :private_network, ip: "10.0.0.12"
    nomadclient2.vm.hostname = "nomadclient2"
    nomadclient2.vm.provision "file", source: "client-2.hcl", destination: "/tmp/config.hcl"
    nomadclient2.vm.provision "shell", inline: $script
  end
end
