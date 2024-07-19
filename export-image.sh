#!/bin/sh

pwd=$(pwd -P)

image=registry.opensuse.org/opensuse/leap:latest

podman pull --arch arm $image

tmpdir=$(mktemp -d)
cd $tmpdir

tar=$tmpdir/tmp.tar

podman save -o $tar $image

tar xvf $tar

rm -f $tar

tar2=$tmpdir/$(ls *.tar)

sysroot=$pwd/sysroot

rm -Rf $sysroot
mkdir $sysroot
cd $sysroot

tar xvf $tar2

rm -Rf $tmpdir
