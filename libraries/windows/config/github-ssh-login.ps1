# -------------------------------------
# Imports
# -------------------------------------
$RootDir = (get-item $PSScriptRoot).parent.parent.FullName
. $RootDir\helpers\misc.ps1


# Configuring git user data
Write-Subtitle "Configuring global git data."
$username = Read-Host "Enter your github user.name"
$email = Read-Host "Enter your github user.email"
git config --global user.name $username
git config --global user.email $email
git config --global init.defaultBranch main
Write-Host ""
Write-Host "--global config data: "
Write-Host ""
git config --list --show-origin
Write-Host ""
Start-Sleep 3


# Login to Github, save public SSH Key and get the credential token
Write-Subtitle "Login to Github and saving the ssh public key."
gh auth login
Write-Host "Github auto login done."
Write-Host ""
Start-Sleep 1