# Function to install the configuration
function Install-NvChadConfig {
    param (
        [string]$NvChadRepo,
        [string]$NvChadConfig,
        [string]$ConfigRepo
    )

    # Check if Git is available
    if (!(Test-Path git)) {
        Write-Host "Git is not installed. Please install Git and rerun the script."
        return
    }

    # Check if a Neovim configuration already exists
    if (Test-Path -Path $NvChadConfig) {
        # If a Neovim configuration already exists, show a message
        Write-Host "A Neovim configuration already exists at $NvChadConfig."

        # Ask the user to confirm the removal of the existing configuration
        $confirm = Read-Host "Do you want to remove the existing configuration and install the new configuration from $ConfigRepo? [Y/N]"

        if ($confirm -eq "Y" -or $confirm -eq "y") {
            # If the user confirms, remove the existing configuration and clone the new one
            Write-Host "Removing the existing configuration..."
            if (Test-Path -Path $NvChadConfig) {
                Remove-Item $NvChadConfig -Recurse -Force
                Write-Host "Cloning the new configuration from $NvChadRepo..."
                git clone $NvChadRepo $NvChadConfig
                Write-Host "Cloning the new configuration from $ConfigRepo to $NvChadConfig\lua\custom..."
                git clone $ConfigRepo "$NvChadConfig\lua\custom"
                Write-Host "Installation complete. Your Neovim configuration is now set up."
            } else {
                Write-Host "Error: Could not remove the existing configuration."
            }
        } else {
            # If the user cancels, show a message
            Write-Host "Installation cancelled."
        }
    } else {
        # If a Neovim configuration doesn't exist, clone the configuration
        Write-Host "Cloning the Neovim configuration from $NvChadRepo..."
        git clone $NvChadRepo $NvChadConfig
        Write-Host "Cloning the new configuration from $ConfigRepo to $NvChadConfig\lua\custom..."
        git clone $ConfigRepo "$NvChadConfig\lua\custom"
        Write-Host "Installation complete. Your Neovim configuration is now set up."
    }
}

# Main script
$NvChadRepo = "https://github.com/NvChad/NvChad.git"
$NvChadConfig = "$env:LOCALAPPDATA\nvim"
$ConfigRepo = "https://github.com/Alexis12119/nvim-config.git"

Install-NvChadConfig -NvChadRepo $NvChadRepo -NvChadConfig $NvChadConfig -ConfigRepo $ConfigRepo
