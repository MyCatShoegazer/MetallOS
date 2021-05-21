#
# File: vbox-run.sh
# Project: MetallOS
# File Created: Wednesday, 6th January 2021 9:27:22 pm
# Author: mycatshoegazer (mycatshoegazer@outlook.com)
# -----
# Last Modified: Wednesday, 6th January 2021 9:27:22 pm
# Modified By: mycatshoegazer (mycatshoegazer@outlook.com>)
# -----
# Copyright 2020 - 2021 mycatshoegazer, mycatshoegazer
#


#!/bin/bash

VM_NAME="MetallOS"

VBoxManage unregistervm --delete $VM_NAME

VBoxManage createvm --name $VM_NAME --ostype "Linux_64" --register --basefolder $(PWD)/debug_vm
VBoxManage modifyvm $VM_NAME --ioapic on
VBoxManage modifyvm $VM_NAME --memory 256 --vram 128
VBoxManage modifyvm $VM_NAME --nic1 nat

VBoxManage storagectl $VM_NAME --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach $VM_NAME --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium $(PWD)/src/metallos.iso
VBoxManage modifyvm $VM_NAME --boot1 dvd --boot2 disk --boot3 none --boot4 none

VBoxManage startvm $VM_NAME