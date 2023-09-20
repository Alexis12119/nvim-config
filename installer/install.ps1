# Experimental
if ($IsWindows)
{
  $NvChad_repo = "https://github.com/NvChad/NvChad.git"
  $NvChad_config = $env:LOCALAPPDATA + "\nvim"

  # Set the location of Neovim configuration
  $config = $env:LOCALAPPDATA + "\nvim\lua\custom"
  
  # Set the repository for Neovim configuration
  $repo = "https://github.com/Alexis12119/nvim-config.git"

  # Check if a Neovim configuration already exists
  if (Test-Path -Path $config)
  {
    # If a Neovim configuration already exists, show a message
    Write-Output "A Neovim configuration already exists at $config."

    # Ask the user to confirm the removal of the existing configuration
    $confirm = Read-Host "Do you want to remove the existing configuration and install the new configuration from $repo? [Y/N]"

    # If the user confirms, remove the existing configuration and clone the new one
    if ($confirm -eq "Y")
    {
      Write-Output "Removing the existing configuration..."
      Remove-Item $NvChad_config -Recurse -Force
      Write-Output "Cloning the new configuration from $repo..."
      git clone $NvChad_repo $NvChad_config
      git clone $repo $config
    } else
    {
      # If the user cancels, show a message
      Write-Output "Installation cancelled."
    }
  } else
  {
    # If a Neovim configuration doesn't exist, clone the configuration
    Write-Output "Cloning the Neovim configuration from $repo..."
    git clone $NvChad_repo $NvChad_config
    git clone $repo $config
  }
}
