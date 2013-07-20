#!/bin/bash
#
# Do the initial setup on a digital ocean server

set -e

if [ $# -ne 2 ]; then
  echo "usage: $0 ip_addr noip-hostname" >&2
  exit 1
fi

ip_addr="$1"; shift
noip_hostname="$1"; shift

vendor_dir="vendor"

remote="root@$ip_addr"

ssh-keygen -R "$ip_addr"
scp -o StrictHostKeyChecking=no $vendor_dir/noip-duc-linux.tar.gz $remote:
scp $vendor_dir/no-ip2.conf $remote:

for f in install-packages.sh install-github-auth.sh install-users.sh install-noip.sh; do
  scp $f $remote:
  ssh $remote chmod +x $f
  ssh $remote ./$f
done

ssh-keygen -R "$noip_hostname"
