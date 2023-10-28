#!/bin/bash

config_dir="$HOME/.config/nvim"
nvchad_repo="https://github.com/NvChad/NvChad.git --depth 1"
config_repo="https://github.com/Alexis12119/nvim-config.git"

# Function to clone a Git repository with error handling
clone_repository() {
    local repo_url="$1"
    local target_dir="$2"

    echo "Cloning $repo_url to $target_dir..."
    if git clone "$repo_url" "$target_dir" 2>/dev/null; then
        echo "Clone successful."
    else
        echo "Error: Could not clone $repo_url to $target_dir."
        exit 1
    fi
}

# Check if the neovim configuration directory already exists
if [ -d "$config_dir" ]; then
    read -p "Neovim configuration directory already exists. Do you want to replace it with the new configuration? (y/n): " response
    if [[ "$response" =~ ^[Yy] ]]; then
        # Remove the existing neovim configuration directory
        echo "Removing the existing neovim configuration directory..."
        if rm -rf "$config_dir" 2>/dev/null; then
            echo "Existing configuration removed."
        else
            echo "Error: Could not remove the existing configuration."
            exit 1
        fi
    else
        echo "Installation aborted."
        exit 1
    fi
fi

# Clone the Git repositories
clone_repository "$nvchad_repo" "$config_dir"
clone_repository "$config_repo" "$config_dir/lua/custom"
nvim

echo "Installation complete. Your neovim configuration is now set up!"
