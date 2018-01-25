#!/bin/bash

cd ~/VirtualBox\ VMs/

VM_NAME=$1
UBUNTU_ISO_PATH=~/Downloads/ubuntu-16.04.3-server-amd64.iso
VM_HD_PATH=${VM_NAME}.vdi

VBoxManage createvm --name CMPE255 --ostype Ubuntu_64 --register

VBoxManage createhd --filename ${VM_HD_PATH} --size 10240

VBoxManage storagectl ${VM_NAME} --name "SATA Controller" --add sata --controller IntelAHCI

VBoxManage storageattach ${VM_NAME} --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium ${VM_HD_PATH}

VBoxManage storagectl ${VM_NAME} --name "IDE Controller" --add ide

VBoxManage storageattach ${VM_NAME} --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium ${UBUNTU_ISO_PATH}

vboxmanage modifyvm $VM_NAME --ioapic on
vboxmanage modifyvm $VM_NAME --memory 1024 --vram 128
vboxmanage modifyvm $VM_NAME --nic1 nat
vboxmanage modifyvm $VM_NAME --natpf1 "guestssh,tcp,,2222,,22"
vboxmanage modifyvm $VM_NAME --natdnshostresolver1 on

