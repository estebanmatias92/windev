# Tab completition and command history
Write-Output "-----------------------------"
Write-Output "--- Installing PSReadLine ---"
Write-Output "-----------------------------"
Write-Output ""
Install-Module -Name PSReadLine -MinimumVersion 2.2.2
Write-Output "Module installed."


# Adds status and auto-completion
Write-Output ""
Write-Output "---------------------------"
Write-Output "--- Installing posh-git ---"
Write-Output "---------------------------"
Write-Output ""
Install-Module -Name posh-git -Force
$env:POSH_GIT_ENABLED = $true
Write-Output "Module installed."


# PowerShell module that provides utilities for working with SSH connections within PowerShell.
Write-Output ""
Write-Output "------------------------------"
Write-Output "--- Installing posh-sshell ---"
Write-Output "------------------------------"
Write-Output ""
Install-Module -Name posh-sshell -Force
Write-Output "Module installed."


# Better SSH session managment
Write-Output ""
Write-Output "---------------------------"
Write-Output "--- Installing Posh-SSH ---"
Write-Output "---------------------------"
Write-Output ""
Install-Module -Name Posh-SSH -Force
Write-Output "Module installed."


# Install prompt theme engine and make it available for any shell
Write-Output ""
Write-Output "-----------------------------"
Write-Output "--- Installing Oh-My-Posh ---"
Write-Output "-----------------------------"
Write-Output ""
Install-Module -Name oh-my-posh -Force
$env:POSH_PATH
Write-Output "Module installed."


# A PowerShell module to show file and folder icons in the terminal.
Write-Output ""
Write-Output "---------------------------------"
Write-Output "--- Installing Terminal-Icons ---"
Write-Output "---------------------------------"
Write-Output ""
Install-Module -Name Terminal-Icons
Write-Output "Module installed."


# This little tool lets you jump directly to your frequently used directories in PowerShell.
Write-Output ""
Write-Output "--------------------"
Write-Output "--- Installing Z ---"
Write-Output "--------------------"
Write-Output ""
Install-Module -Name z
Write-Output "Module installed."


# Update all modules
Write-Output ""
Write-Output "--------------------------"
Write-Output "--- Update all modules ---"
Write-Output "--------------------------"
Write-Output ""
Update-Module
Write-Output "The modules are up to date"
Start-Sleep 2