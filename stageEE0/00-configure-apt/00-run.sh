#!/bin/bash -e

install -m 644 files/ltsp-ubuntu-ppa-focal.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"

on_chroot apt-key add - < files/ltsp_ubuntu_ppa.gpg
on_chroot << EOF
apt-get update
EOF
