$RootDir = (get-item $PSScriptRoot).parent.parent.parent.FullName
# -------------------------------------
# Imports
# -------------------------------------
. $RootDir\helpers\misc.ps1


# Dotfiles Folder Path
$DotfilesDir = "$($PSScriptRoot)\.dotfiles"

# Configuring Powershell 
Write-Subtitle "Creating environment variables"
# Get the IP v4
$ipv4 = (Get-NetIPAddress | Where-Object {$_.AddressState -eq "Preferred" -and $_.ValidLifetime -lt "24:00:00"}).IPAddress
# Create the environment var
[System.Environment]::SetEnvironmentVariable('IPAddress', $ipv4)
Write-Host "Environment (IPAddress) created."
Write-Host ""
Start-Sleep 1

# Configuring Powershell 
Write-Subtitle "Downloading PowerShell profile and copying it"
. $DotfilesDir\powershell-profile.ps1 
Write-Host "PowerShell profile is copied."
Write-Host ""
Start-Sleep 1

# Configuring Windos Terminal Preview
Write-Subtitle "Downloading Windows Terminal Preview settings and copying them"
. $DotfilesDir\windows-terminal-preview-settings.ps1
Write-Host "Windows Terminal Preview settings are copied."
Write-Host ""
Start-Sleep 2