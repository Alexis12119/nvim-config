# Function to clone a Git repository with error handling
function Clone-Repository {
    param (
        [string]$RepoUrl,
        [string]$TargetDir
    )

    Write-Host "Cloning $RepoUrl to $TargetDir..."
    try {
        git clone $RepoUrl $TargetDir
        Write-Host "Clone successful."
    } catch {
        Write-Host "Error: Could not clone $RepoUrl to $TargetDir."
        exit 1
    }
}

# Main script
$NvChadRepo = "https://github.com/NvChad/NvChad.git"
$NvChadConfig = "$env:LOCALAPPDATA\nvim"
$ConfigRepo = "https://github.com/Alexis12119/nvim-config.git"

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
Clone-Repository -RepoUrl $NvChadRepo -TargetDir $NvChadConfig
Clone-Repository -RepoUrl $ConfigRepo -TargetDir "$NvChadConfig\lua\custom"
nvim

Write-Host "Installation complete. Your Neovim configuration is now set up."
