#!/bin/bash

cmd=$1

BUSYBOX_INSTALL_PATH=/root/Documents/DJI/EmuKernel/busybox-1.30.1/_install
INITRAMFS_PATH=/root/Documents/DJI/EmuKernel/rootfs/initramfs

function update_initramfs(){
    rm -f initramfs.cpio || false
    (cd initramfs && find . -print0 | cpio --null -o --format=newc > ../initramfs.cpio) || false
}

case $cmd in
    "initramfs")
        echo "update initramfs"
        update_initramfs
        ;;
    "busybox")
    echo "update busybox"
    cp -av $BUSYBOX_INSTALL_PATH/* $INITRAMFS_PATH
    ;;
    *)
    echo "unkown cmd"
    ;;
esac

