# Enterprise UI Dev Box

This virtual box image makes it easier for developers behind corporate firewalls to use modern web development tooling. Using this box allows you to reduce the amount of configuration and setup you need to do to start building. [vagrant-proxyconfig](https://github.com/tmatilai/vagrant-proxyconf) plugin makes it easy to maintain correct proxy settings inside of the VM.

## What does it come installed with?

1. Git
1. [HTTPie](https://httpie.org/) - a command line HTTP client with intuitive UI, JSON support, syntax highlighting & more
1. [nvm.js](https://github.com/creationix/nvm) - makes it possible to select version of node that you need.
1. [fzf](https://github.com/junegunn/fzf) - a cmd line fuzzy finder. Useful tool to lookup files & history. Here's a [5 minute video](https://www.youtube.com/watch?v=AX3u10bruOI) on how to use it.
1. [Git extras](https://github.com/tj/git-extras/blob/master/Commands.md) - Additional git commands to supercharge your workflow.
1. [ag](https://github.com/ggreer/the_silver_searcher/blob/master/README.md)
1. [oh-my-zsh](https://www.youtube.com/watch?v=9jACAQ4MHWs) - a better alternative to bash.
1. [aria2](https://aria2.github.io/) - a better command line download utility
1. [yarn](http://yarnpkg.com) - a popular npm alternative
1. vim
1. curl
1. [glances](https://nicolargo.github.io/glances/) - a system monitoring tool
1. [watchman](https://facebook.github.io/watchman/) - A file watching service

## Getting started

- Download [virtualbox-iso.tgz](https://github.com/this-dot/enterprise-ui-dev-box/releases/) and extract it. 
- Open frontend-dev-box.ovf
- When virtualbox shows the import dialog select the 'Reinitialize the MAC address of all network cards'.
- Once its imported into virtualbox, right click the machine, click on 'Settings', go to the 'Network' tab and change it from 'NAT' to 'Bridged Adapter'.
- Start the machine & login with the credentials `vagrant`/`vagrant`. Run `ifconfig` to find its ip. You can use the ip from the response to ssh into the vm from your host machine using a ssh client like putty.
- Setup proxy settings based on the next section.

## Proxy Setup
- To setup proxy scripts go into the `~/machine_proxy_setup` and run `./main.py`
- By default a function called `setup_proxy` is run whenever a new shell is opened, if you want to temporarily disable it for a shell session, then run `unset_proxy`

## Release a new image
- Requirements
  - [packer](https://www.packer.io/downloads.html)
  - [Virtualbox](https://www.virtualbox.org/)
- Run `packer build packer.json`
- Run `tar -cvzf virtualbox-iso.tgz virtualbox-iso`
