#!/bin/bash
clear
echo "** Cleanup, update everything and install dependencies"
sudo apt remove -y open-vm-tools --purge && sudo apt update && sudo apt upgrade -y && sudo apt install -y gcc binutils make &> /dev/null

echo "** Preparing ... "
{
  sudo mkdir /mnt/cdrom
  sudo mount /dev/cdrom /mnt/cdrom 
  ls /mnt/cdrom
  tar xzvf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
  cd /tmp/vmware-tools-distrib/
} &> /dev/null

echo "** Install the VMTools"
sudo ./vmware-install.pl -d
