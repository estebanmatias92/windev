$RootDir = (get-item $PSScriptRoot).parent.parent.parent.FullName
# -------------------------------------
# Imports
# -------------------------------------
. $RootDir\helpers\misc.ps1


# Download and Install fonts
Write-Subtitle "Downloading and Installing Fonts"
Download-Install-Fonts "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip"
Write-Host "Fonts installed."
Start-Sleep 1