# Raspbery Pi USB Gadget Image Builder

A script to add USB Ethernet Gadget configuration to a standard Raspbian Lite SD Card image. 
This should work with Raspberry Pi Zero, Zero W and 4.

Currently only tested on Linux and with Docker Desktop + WSL on Windows 10, but should also run on OSx 


## Requirements

 - Docker
 - expect

## Install

Clone the repo

```
git clone git@github.com:hardillb/rpi-gadget-image-creator.git
```

Copy the raspbian lite image into the `rpi-gadget-image-creator`  directory.

## Running

```
./create-image 2019-09-26-raspbian-buster-lite.img
```

Once complete you can write the image file to a SD Card with any of the usual tools e.g. `dd` or `balena-etch`.
You can find instructions on the Raspberry Pi website [here](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)

## TODO

Look at repackaging everything into an extention to DockerPi so the whole thing runs in the container.
