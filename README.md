# Vagrant Enterprise UI Dev Box

This Vagrant box makes it easier for developers behind corporate firewalls to use modern web development tooling. Using this box allows you to reduce the amount of configuration and setup you need to do to start building. [vagrant-proxyconfig](https://github.com/tmatilai/vagrant-proxyconf) plugin makes it easy to maintain correct proxy settings inside of the VM.

## What does it come installed with?

1. Git with OpenSSL (source)[https://gist.github.com/pescobar/6ae5634f92d75d23c36a] - makes Git more resiliant when interacting with a remote server through a corporate proxy
2. [nvm.js](https://github.com/creationix/nvm) - makes it possible to select version of node that you need.
3. [yarn](http://yarnpkg.com) - a popular npm alternative
4. vim
5. curl

## Getting started

To use this box, create a Vagrant file using `thisdot/enterprise-ui-dev` base box. You can also use the following Vagrant file as a template.

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "thisdot/enterprise-ui-dev"

  # if you do not wish to hard code your proxy settings, 
  # you may use an environment variable on your host machine.
  # For more information see https://github.com/tmatilai/vagrant-proxyconf#environment-variables-1
  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "<your_proxy_config>"
    config.proxy.https    = "<your_proxy_config>"
    config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder ".", "/vagrant"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    source ~/.nvm/nvm.sh
    cd /vagrant
    npm install
  SHELL
end
```