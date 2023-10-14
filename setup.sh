#!/bin/bash

if [[ $# -eq 0 ]]; then
  echo "You must pass a image file"
  exit
fi

if [[ $# -eq 2 ]]; then
  64BIT=1
fi
OFFSET=$(fdisk -l $1 | grep W95 | awk '/^[^ ]*1/{ print $2*512 }')
mkdir boot
sudo mount -o loop,offset=$OFFSET $1 boot

read -rsp "Please enter password for pi user: " PASSWORD
echo
PASS=$(echo $PASSWORD |  openssl passwd -6 -stdin)
echo "pi:$PASS" > userconf.txt

sudo cp userconf.txt boot/userconf.txt
sudo sync

sudo umount boot
rmdir boot
export PASSWORD
if [[ 64BIT eq 1 ]]; then
  ./create-image -64 $1
else
  ./create-image $1
fi
