#!/bin/bash

OFFSET=$(fdisk -l $1 | awk '/^[^ ]*1/{ print $2*512 }')
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
./create-image $1
