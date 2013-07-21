#!/bin/bash

set -e

no_ip_path=/vagrant/no-ip

if [ ! -f $no_ip_path/no-ip2.conf ]; then
  echo "$no_ip_path/no-ip2.conf is missing" >&2
  exit 1
fi

tar -zxf $no_ip_path/noip-duc-linux.tar.gz
cd noip-2.1.9-1/
make
# make install
if [ ! -d /usr/local/bin ]; then mkdir -p /usr/local/bin;fi
if [ ! -d /usr/local/etc ]; then mkdir -p /usr/local/etc;fi
cp noip2 /usr/local/bin/noip2
mv $no_ip_path/no-ip2.conf /usr/local/etc
chmod 600 /usr/local/etc/no-ip2.conf

cp redhat.noip.sh /etc/rc.d/init.d/noip
chmod +x /etc/rc.d/init.d/noip
chkconfig noip on
service noip start
