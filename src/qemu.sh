#!/bin/sh
set -e
. ./iso.sh

qemu-system-$(./target-triplet-to-arch.sh $HOST) -D ./log.txt -nographic -cdrom metallos.iso
