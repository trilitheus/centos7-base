rm -f /etc/sysconfig/network-scripts/ifcfg-eth*

cat >> /etc/sysconfig/network-scripts/ifcfg-eth0 << EOF
# Added by packer
DEVICE="eth0"
BOOTPROTO="dhcp"
ONBOOT="yes"
DEFROUTE="yes'
EOF

cat >> /etc/sysconfig/network-scripts/ifcfg-eth1 << EOF
# Added by packer
DEVICE="eth1"
BOOTPROTO="dhcp"
ONBOOT="yes"
EOF
