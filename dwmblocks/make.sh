#!/bin/sh

# Navigate to the directory
cd /home/j3ll0/.suckless/dwmblocks/ || exit 1

# Remove the blocks.h file (if it exists)
sudo rm -f blocks.h

# Clean and rebuild
sudo make clean install

# Restart dwmblocks
pkill dwmblocks
dwmblocks &
