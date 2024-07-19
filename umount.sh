#!/bin/sh -x

pwd=$(pwd -P)
root=$pwd/debian-armhf

sudo umount $root/proc
sudo umount $root/dev
sudo umount $root/$HOME/gdb
sudo umount $root
