# Overview

This contains the recipes to build up a Digital Ocean droplet from sctatch
so that it can be used for remote pair programming.

The goal was to make a cheap system, so I could store images in Digital Ocean
and delete the actual droplets until they are needed. The down-side to this
is that it can take 10 to 15 minutes to create and destroy a virtual private
server.

It uses no-ip's dynamic DNS to map a name to whatever address I get from
Digital Ocean.

The plan is to create a basic sharing environment template which can be
instantiated and then customized to each pairing project.

# Template Creation

## Prerequisites

### http://www.noip.com

Sign up for noip.

Download the no-ip client from http://www.noip.com/client/linux/noip-duc-linux.tar.gz
into the `vendor` directory, and if necessary create a config file by setting it
up in a local VM and creating the config file as part of `make install`.

### http://www.digitalocean.com

Sign up for a Digital Ocean account

Create a droplet:

    Hostname: mike-stok-pairing
    Select Size: 512MB/1CPU/20GB SSD 1TB
    Region: SF 1
    Image: CentOS 6.4 x64
    SSH keys: mike's laptop digital ocean key

192.241.213.93 Active 512MB Ram 20GB SSD Disk San Francisco 1 CentOS 6.4 x64

then

    ./populate-template.sh 192.241.213.93 mikestok.no-ip.biz
