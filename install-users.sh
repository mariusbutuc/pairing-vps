#!/bin/bash

useradd -c "Mike Stok" mike
mkdir ~mike/.ssh
cp ~root/.ssh/authorized_keys ~mike/.ssh
chown -R mike.mike ~mike/.ssh
chmod 755 ~mike/.ssh
chmod 644 ~mike/.ssh/authorized_keys

useradd -c "Pairing Partner" pair
mkdir ~pair/.ssh
cp ~root/.ssh/authorized_keys ~pair/.ssh
chown -R pair.pair ~pair/.ssh
chmod 755 ~pair/.ssh
chmod 644 ~pair/.ssh/authorized_keys
