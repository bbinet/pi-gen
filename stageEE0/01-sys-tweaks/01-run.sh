#!/bin/bash -e

on_chroot << EOF

systemctl mask dhcpcd dphys-swapfile raspi-config resize2fs_once

echo "proc            /proc           proc    defaults          0       0" > /etc/fstab

EOF
