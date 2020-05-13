#!/bin/bash

# Vagrant shell provisioning script https://www.vagrantup.com/docs/provisioning/shell.html

set -e -x

/usr/bin/apt-get -qq update
/usr/bin/apt-get install -q -y docker.io
/usr/bin/apt-get -y autoremove
/usr/bin/apt-get clean

/bin/systemctl start docker.service
/usr/sbin/usermod -aG docker vagrant

NEW_PATH='${HOME}/bcbio-vm/anaconda/bin:${HOME}/local/bin:${PATH}'
/bin/grep -qxF "PATH=${NEW_PATH}" ~vagrant/.profile || /bin/echo "PATH=${NEW_PATH}" >> ~vagrant/.profile
