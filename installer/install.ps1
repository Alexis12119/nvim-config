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
$ConfigRepo = "https://github.com/Alexis12119/nvim-config.git"
$ConfigPlugins = "$env:LOCALAPPDATA\nvim-data\lazy"
$ConfigPath = "$env:LOCALAPPDATA\nvim"

# Check if a Neovim configuration already exists
if (Test-Path -Path $ConfigPath) {
    Write-Host "A Neovim configuration already exists at $ConfigPath."
    $confirmReplace = Read-Host "Do you want to replace it with the new configuration? [Y/N]"
    if ($confirmReplace -eq "Y" -or $confirmReplace -eq "y") {
        $confirmRemovePlugins = Read-Host "Do you want to remove the existing plugins as well? [Y/N]"
        if ($confirmRemovePlugins -eq "Y" -or $confirmRemovePlugins -eq "y") {
            if (Test-Path -Path $ConfigPlugins) {
                Write-Host "Removing the existing plugins..."
                Remove-Item $ConfigPlugins -Recurse -Force
            } else {
                Write-Host "No plugin directory found. Skipping plugin removal."
            }
        }

        Write-Host "Removing the existing configuration..."
        Remove-Item $ConfigPath -Recurse -Force
    } else {
        Write-Host "Installation cancelled."
        return
    }
}

# Clone the Git repository
Clone-Repository -RepoUrl $ConfigRepo -TargetDir $ConfigPath

Write-Host "Launching Neovim to complete setup..."
nvim

Write-Host "Installation complete. Your Neovim configuration is now set up."
