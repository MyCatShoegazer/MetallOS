#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/metallos.kernel isodir/boot/metallos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "metallos" {
	multiboot /boot/metallos.kernel
}
EOF
grub-mkrescue -o metallos.iso isodir
