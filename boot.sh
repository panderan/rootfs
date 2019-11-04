#!/bin/bash

append="rdinit=/linuxrc"
others=""
if [ "$1" == "nographic" ]; then
    append="${append} console=ttyS0"
    others="-nographic"
fi

qemu-system-x86_64.exe -smp 2 -m 2048 -kernel ./bzImage  -initrd ./initramfs.cpio -append "${append}" ${others}
