#!/bin/sh -x

pwd=$(pwd -P)

root=$pwd/debian-armhf

# Arch-chroot needs $root to be a mount point.
sudo mount --rbind $root $root

# Make $HOME dirs available.
for dir in gdb gcc; do
    mkdir -p $root/$HOME/$dir
    sudo mount --bind $HOME/$dir $root/$HOME/$dir
done

sudo ./arch-chroot $root

sudo umount $root/$HOME/gdb
sudo umount $root
