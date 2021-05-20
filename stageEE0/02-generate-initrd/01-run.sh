#!/bin/bash -e

firmware=$(zgrep "firmware as of" \
"$ROOTFS_DIR/usr/share/doc/raspberrypi-kernel/changelog.Debian.gz" | \
head -n1 | sed -n 's|.* \([^ ]*\)$|\1|p')

uname_r="$(curl -s -L "https://github.com/raspberrypi/firmware/raw/$firmware/extra/uname_string7" | sed "s/Linux version \([^ ]\+\) .*/\1/")"

on_chroot << EOF
update-initramfs -c -k ${uname_r}
EOF
