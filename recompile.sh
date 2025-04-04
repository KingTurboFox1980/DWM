#!/bin/sh

# Function to rebuild dwm-config
rebuild_dwm_config() {
    echo "Rebuilding dwm-config (config.h)..."
    cd /home/j3ll0/.suckless/dwm-flexipatch/ || exit 1
    sudo rm -rf config.h
    sudo make clean install
    echo "dwm-config rebuilt successfully!"
}

# Function to rebuild dwm-patches
rebuild_dwm_patches() {
    echo "Rebuilding dwm-patches (patches.h)..."
    cd /home/j3ll0/.suckless/dwm-flexipatch/ || exit 1
    sudo rm -rf patches.h
    sudo make clean install
    echo "dwm-patches rebuilt successfully!"
}

# Function to rebuild and restart dwmblocks
rebuild_dwmblocks() {
    echo "Rebuilding and restarting dwmblocks..."
    cd /home/j3ll0/.suckless/dwmblocks/ || exit 1
    sudo rm -f blocks.h
    sudo make clean install
    pkill dwmblocks
    dwmblocks &
    echo "dwmblocks rebuilt and restarted successfully!"
}

# Function to rebuild dmenu-flexipatch
rebuild_dmenu() {
    echo "Rebuilding dmenu-flexipatch..."
    cd /home/j3ll0/.suckless/dmenu-flexipatch/ || exit 1
    sudo rm -rf config.h
    sudo make clean install
    echo "dmenu-flexipatch rebuilt successfully!"
}

# Function to restart sxhkd and dwm
restart_sxhkd_and_dwm() {
    echo "Restarting sxhkd and dwm..."
    pkill sxhkd
    sxhkd &
    echo "sxhkd restarted successfully!"
    pkill dwm
}

# Menu to select options
echo "Please select an option:"
echo "1) Rebuild dwm-config"
echo "2) Rebuild dwm-patches"
echo "3) Rebuild and restart dwmblocks"
echo "4) Rebuild dmenu-flexipatch"
echo "5) Restart sxhkd and dwm"
echo "6) Rebuild All"
echo "7) Exit"

read -r choice

case $choice in
    1)
        rebuild_dwm_config
        ;;
    2)
        rebuild_dwm_patches
        ;;
    3)
        rebuild_dwmblocks
        ;;
    4)
        rebuild_dmenu
        ;;
    5)
        restart_sxhkd_and_dwm
        ;;
    6)
        rebuild_dwm_config
        rebuild_dwm_patches
        rebuild_dwmblocks
        rebuild_dmenu
        restart_sxhkd_and_dwm
        ;;
    7)
        echo "Exiting script. Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid option. Please try again."
        ;;
esac

# Exit dwm after rebuilding
pkill dwm
