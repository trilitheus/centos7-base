#!/bin/bash

sudo mount /home/vagrant/VBoxGuestAdditions.iso /media
sudo yum install bzip2 kernel-devel -y
sudo yum groups install 'Development Tools' -y
echo 'yes' | sudo /media/VBoxLinuxAdditions.run --nox11
sudo yum remove kernel-devel -y
sudo yum groups remove 'Development Tools' -y
sudo yum autoremove -y
sudo umount /media
sudo rm -f /home/vagrant/VBoxGuestAdditions.iso
