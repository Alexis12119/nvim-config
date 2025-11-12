#!/bin/bash

config_dir="$HOME/.config/nvim"
config_plugins="$HOME/.local/share/nvim/lazy"
config_repo="https://github.com/Alexis12119/nvim-config.git"

# Function to clone a Git repository with error handling
clone_repository() {
  local repo_url="$1"
  local target_dir="$2"

  echo "Cloning $repo_url to $target_dir..."
  if git clone "$repo_url" "$target_dir" >/dev/null 2>&1; then
    echo "Clone successful."
  else
    echo "Error: Could not clone $repo_url to $target_dir."
    exit 1
  fi
}

# Function to remove existing plugins
remove_existing_plugins() {
  if [ -d "$config_plugins" ]; then
    echo "Removing the existing plugins..."
    rm -rf "$config_plugins"
  else
    echo "No plugin directory found. Skipping plugin removal."
  fi
}

# Check if the Neovim configuration directory already exists
if [ -d "$config_dir" ]; then
  read -rp "Neovim configuration directory already exists. Do you want to replace it with the new configuration? (y/n): " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    read -rp "Do you want to remove the existing plugins as well? (y/n): " remove_plugins_response
    if [[ "$remove_plugins_response" =~ ^[Yy]$ ]]; then
      remove_existing_plugins
    fi

    echo "Removing the existing Neovim configuration directory..."
    if rm -rf "$config_dir" >/dev/null 2>&1; then
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

# Clone the Git repository
clone_repository "$config_repo" "$config_dir"

echo "Launching Neovim to complete setup..."
nvim

echo "Installation complete. Your Neovim configuration is now set up!"
