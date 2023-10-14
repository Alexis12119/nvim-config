#!/bin/bash

config_dir="$HOME/.config/nvim"

# Check if the neovim configuration directory already exists
if [ -d "$config_dir" ]; then
    read -p "Neovim configuration directory already exists. Do you want to replace it with the new configuration? (y/n): " response
    if [[ "$response" =~ ^[Yy] ]]; then
        # Remove the existing neovim configuration directory
        rm -rf $config_dir
    else
        echo "Installation aborted."
        exit 1
    fi
fi

# Clone the Git repository directly
git clone https://github.com/NvChad/NvChad.git ~/.config/nvim
git clone https://github.com/Alexis12119/nvim-config.git ~/.config/nvim/lua/custom

echo "Installation complete. Your neovim configuration is now set up!"
