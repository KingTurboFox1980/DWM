#!/bin/sh

cd /home/j3ll0/.suckless/dwm-flexipatch/ &&
sudo rm -rf patches.h &&
sudo make clean install
