# Dotfiles Folder Path
$DotfilesDir = "$($PSScriptRoot)\.dotfiles"

# Configuring Powershell 
Write-Subtitle "Downloading PowerShell profile and copying it."
. $DotfilesDir\powershell-profile.ps1 
Write-Host "PowerShell profile is copied."
Write-Host ""
Start-Sleep 1

# Configuring Windos Terminal Preview
Write-Subtitle "Downloading Windows Terminal Preview settings and copying them."
. $DotfilesDir\windows-terminal-preview-settings.ps1
Write-Host "Windows Terminal Preview settings are copied."
Write-Host ""
Start-Sleep 2