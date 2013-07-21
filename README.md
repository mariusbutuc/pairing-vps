# Overview

This contains the recipes to build up a Digital Ocean droplet from sctatch
so that it can be used for remote pair programming.

The goal was to make a cheap system, so I could store images in Digital Ocean
and delete the actual droplets until they are needed. The down-side to this
is that it can take 10 to 15 minutes to create and destroy a virtual private
server.

The plan is to create a basic sharing environment template which can be
instantiated and then customized to each pairing project.

# Template Creation

## Prerequisites

### Vagrant - http://www.vagrantup.com

This needs to be installed on the host you work on as it is used to build the
droplet.

### http://www.digitalocean.com

Sign up for a Digital Ocean account.

## Nice to Have

As the scripts are set up they expect a no-ip account to be set up.

### Free DNS http://www.noip.com

Sign up for noip.

Download the no-ip client from http://www.noip.com/client/linux/noip-duc-linux.tar.gz
into the `no-ip` directory, and if necessary create a config file by setting it
up in a local VM and creating the config file as part of `make install`.

## Process to Build the Template

### Configuration File Set-up

Copy `digital-ocean-credentials.sample` to `digital-ocean-credentials.rb` and
fill in the values with the path to the private key which identifies you to
Digital Ocean and your Digital Ocean API credentials.

### no-ip setup

If you are using no-ip then generate your configuration file and put it in the
`no-ip` directory.

If you aren't using `no-ip` then comment out the following line in the
`Vagrantfile` by putting a `#` character at the beginning of the line:

    config.vm.provision :shell, path: 'install-noip.sh'

### Vagrant Plug-in Installation

Look at https://github.com/smdahlen/vagrant-digitalocean for background, the
essential steps are:

* `vagrant plugin install vagrant-digitalocean`
* `vagrant box add digital_ocean https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box`

## Build the Template Machine

You should be able to run:

    vagrant up --provider digital_ocean

If you are using some kind of dynamic DNS then you probably need to clean
up the known hosts entries each time the machine is built or rebuilt. You can
use a command like `ssh-keygen -R my.host.name` to do this.

Once this has been done you can halt the droplet by sshing in to it and
halting it from the command line. Then you can take a snapshot of the droplet,
which allows you to destroy and recreate it from the image at will.
