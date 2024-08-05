$RootDir = (get-item $PSScriptRoot).parent.parent.parent.parent.FullName
# -------------------------------------
# Imports
# -------------------------------------
. $RootDir\helpers\misc.ps1

# Tab completition and command history
Install-PwshModule PSReadLine -MinimumVersion 2.2.2

# Adds status and auto-completion
Install-PwshModule posh-git 
$Env:POSH_GIT_ENABLED = $true

# A PowerShell module to show file and folder icons in the terminal.
Install-PwshModule Terminal-Icons

# Install prompt theme engine and make it available for any shell
winget install JanDeDobbeleer.OhMyPosh -s winget

# Fuzzy Finder for directories and files
winget install fzf

# This little tool lets you jump directly to your frequently used directories in PowerShell.
winget install ajeetdsouza.zoxide

# Update all modules
Write-Subtitle "Updating all modules"

Update-Module -force -AcceptLicense
Get-Module -ListAvailable

Write-Host ""
Write-Host "The modules are up to date."
Write-Host ""
Start-Sleep 3