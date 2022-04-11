Write-Host "-----------------------------------------------------"
Write-Host "--- Downloading PowerShell profile and copying it ---"
Write-Host "-----------------------------------------------------"
Write-Host ""

. $PSScriptRoot\.dotfiles\powershell-profile.ps1 

Write-Host "PowerShell profile is copied"
Start-Sleep 1


Write-Host ""
Write-Host "----------------------------------------------------------------------"
Write-Host "--- Downloading Windows Terminal Preview settings and copying them ---"
Write-Host "----------------------------------------------------------------------"
Write-Host ""

. $PSScriptRoot\.dotfiles\windows-terminal-preview-settings.ps1

Write-Host "Windows Terminal Preview settings are copied"
Start-Sleep 2