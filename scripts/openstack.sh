#!/bin/bash

# To allow openstack to initiate reboots or shutdowns the acpid service requires to be installed and enabled
yum install -y acpid
systemctl enable acpid

# The cloud-init package automatically fetches the public key from the metadata server and places the key in an account
yum install -y epel-release.noarch
yum install -y cloud-init

# In order for the root partition to properly resize one must install cloud-utils-growpart which contains the proper tools to allow the disk to resize using cloud-init
yum install -y cloud-utils-growpart

# For the instance to access the metadata service, the default zeroconf route must be disabled
echo "NOZEROCONF=yes" >> /etc/sysconfig/network

#
cat >> /etc/default/grub << EOF
GRUB_TIMEOUT=1
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL="serial console"
GRUB_SERIAL_COMMAND="serial --speed=115200"
GRUB_CMDLINE_LINUX=" vconsole.keymap=us console=tty0 vconsole.font=latarcyrheb-sun16 console=ttyS0,115200"
GRUB_DISABLE_RECOVERY="true"
EOF

grub2-mkconfig -o /boot/grub2/grub.cfg
