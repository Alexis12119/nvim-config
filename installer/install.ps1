# Function to install Neovim configuration
function Install-NvChadConfig
{
  param (
    [string]$NvChadRepo,
    [string]$NvChadConfig,
    [string]$ConfigRepo
  )

  # Check if a Neovim configuration already exists
  if (Test-Path -Path $NvChadConfig)
  {
    # If a Neovim configuration already exists, show a message
    Write-Output "A Neovim configuration already exists at $NvChadConfig."

    # Ask the user to confirm the removal of the existing configuration
    $confirm = Read-Host "Do you want to remove the existing configuration and install the new configuration from $ConfigRepo? [Y/N]"

    # If the user confirms, remove the existing configuration and clone the new one
    if ($confirm -eq "Y")
    {
      Write-Output "Removing the existing configuration..."
      Remove-Item $NvChadConfig -Recurse -Force
      Write-Output "Cloning the new configuration from $NvChadRepo..."
      git clone $NvChadRepo $NvChadConfig
      Write-Output "Cloning the new configuration from $ConfigRepo to $NvChadConfig\lua\custom..."
      git clone $ConfigRepo "$NvChadConfig\lua\custom"
    } else
    {
      # If the user cancels, show a message
      Write-Output "Installation cancelled."
    }
  } else
  {
    # If a Neovim configuration doesn't exist, clone the configuration
    Write-Output "Cloning the Neovim configuration from $ConfigRepo..."
    git clone $NvChadRepo $NvChadConfig
    Write-Output "Cloning the new configuration from $ConfigRepo to $NvChadConfig\lua\custom..."
    git clone $ConfigRepo "$NvChadConfig\lua\custom"
  }
}

# Main script
if ($IsWindows)
{
  $NvChadRepo = "https://github.com/NvChad/NvChad.git"
  $NvChadConfig = "$env:LOCALAPPDATA\nvim"
  $ConfigRepo = "https://github.com/Alexis12119/nvim-config.git"

  Install-NvChadConfig -NvChadRepo $NvChadRepo -NvChadConfig $NvChadConfig -ConfigRepo $ConfigRepo
}
