#!/bin/bash -e

rm -rf "${ROOTFS_DIR}"
mkdir -p "${ROOTFS_DIR}"

rsync -aHAXx --exclude /var/cache/apt/archives --exclude /boot "${EXPORT_ROOTFS_DIR}/" "${ROOTFS_DIR}/"
rsync -rtx "${EXPORT_ROOTFS_DIR}/boot/" "${ROOTFS_DIR}/boot/"
