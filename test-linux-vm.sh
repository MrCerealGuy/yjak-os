#!/bin/sh

# This script starts the QEMU PC emulator, booting from the
# YJAK-OS floppy disk image

qemu-system-i386 -drive format=raw,file=disk_images/yjakos.flp,index=0,if=floppy
