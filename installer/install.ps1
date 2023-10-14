# Function to install the configuration
function Install-NvChadConfig {
    param (
        [string]$NvChadRepo,
        [string]$NvChadConfig,
        [string]$ConfigRepo
    )

    # Check if a Neovim configuration already exists
    if (Test-Path -Path $NvChadConfig) {
        Write-Host "A Neovim configuration already exists at $NvChadConfig."
        $confirm = Read-Host "Do you want to replace it with the new configuration? [Y/N]"

        if ($confirm -eq "Y" -or $confirm -eq "y") {
            Write-Host "Removing the existing configuration..."
            Remove-Item $NvChadConfig -Recurse -Force
        } else {
            Write-Host "Installation cancelled."
            return
        }
    }

    # Clone the Git repositories
    Write-Host "Cloning the Neovim configuration from $NvChadRepo..."
    git clone $NvChadRepo $NvChadConfig
    Write-Host "Cloning the new configuration from $ConfigRepo to $NvChadConfig\lua\custom..."
    git clone $ConfigRepo "$NvChadConfig\lua\custom"
    Write-Host "Installation complete. Your Neovim configuration is now set up."
}

# Main script
$NvChadRepo = "https://github.com/NvChad/NvChad.git"
$NvChadConfig = "$env:LOCALAPPDATA\nvim"
$ConfigRepo = "https://github.com/Alexis12119/nvim-config.git"

Install-NvChadConfig -NvChadRepo $NvChadRepo -NvChadConfig $NvChadConfig -ConfigRepo $ConfigRepo
