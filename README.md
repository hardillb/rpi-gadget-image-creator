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
git clone https://github.com/hardillb/rpi-gadget-image-creator.git
```

Copy the raspbian lite image into the `rpi-gadget-image-creator`  directory.

## Running

```
./create-image 2019-09-26-raspbian-buster-lite.img
```

To build a 64bit OS image you need to add `-64` before the image name. 64bit versions will run on Pi 3 and Pi 4 hardware.

```
./create-image -64 2020-08-20-raspios-buster-arm64.img
```


Once complete you can write the image file to a SD Card with any of the usual tools e.g. `dd` or `balena-etch`.
You can find instructions on the Raspberry Pi website [here](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)

## TODO

Look at repackaging everything into an extention to DockerPi so the whole thing runs in the container.
