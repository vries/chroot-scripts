#!/bin/sh

pwd=$(pwd -P)

image=registry.opensuse.org/opensuse/leap:latest
#image=registry.opensuse.org/opensuse/tumbleweed
#image=registry.fedoraproject.org/fedora:rawhide
#image=docker.io/arm32v7/ubuntu:24.04

keep=false

arch=
#arch="--arch arm"
#arch="--arch ppc64le"

podman pull $arch $image

if ! $keep; then
    tmpdir=$(mktemp -d)
else
    tmpdir=$pwd/local.tmpdir
    rm -Rf $tmpdir
    mkdir -p $tmpdir
fi

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

if ! $keep; then
    rm -Rf $tmpdir
fi
