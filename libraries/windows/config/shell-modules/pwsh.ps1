# Handy Helper to avoid repeated work
function Install-PwshModule {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(
            Position = 0, 
            ValueFromRemainingArguments
            )]
        $Module        
    )

    Write-Output " <> Installing $($Module[0])"
    Write-Output ""

    if (get-module -Name $Module[0] -ListAvailable) {
        Uninstall-Module -Name $Module[0]
    }
    Install-Module -Name $Module -Force

    Write-Output "Module installed."
}

# Tab completition and command history
Install-PwshModule PSReadLine -MinimumVersion 2.2.2

# Adds status and auto-completion
Install-PwshModule posh-git 
$env:POSH_GIT_ENABLED = $true

# PowerShell module that provides utilities for working with SSH connections within PowerShell.
Install-PwshModule posh-sshell

# Better SSH session managment
Install-PwshModule Posh-SSH 

# Install prompt theme engine and make it available for any shell
Install-PwshModule oh-my-posh 
$env:POSH_PATH

# A PowerShell module to show file and folder icons in the terminal.
Install-PwshModule Terminal-Icons

# This little tool lets you jump directly to your frequently used directories in PowerShell.
Install-PwshModule z

# Update all modules
Write-Output " <> Updating all modules ---"
Write-Output ""

Update-Module
Get-InstalledModule

Write-Output ""
Write-Output "The modules are up to date"
Start-Sleep 2