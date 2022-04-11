# Configuring git user data
Write-Host "-----------------------------------"
Write-Host "--- Configuring global git data ---"
Write-Host "-----------------------------------"
Write-Host ""
$mygitusername = Read-Host "Enter your github user.name"
$mygituseremail = Read-Host "Enter your github user.email"
git config --global user.name $mygitusername
git config --global user.email $mygituseremail
git config --global init.defaultBranch main
Write-Host ""
Write-Host "--global config data: "
Write-Host ""
git config --list --show-origin
Start-Sleep 3


# Login to Github, save public SSH Key and get the credential token
Write-Host ""
Write-Host "-----------------------------------------------------"
Write-Host "--- Login to Github and saving the ssh public key ---"
Write-Host "-----------------------------------------------------"
Write-Host ""
gh auth login
Write-Host "Github auto login done."
Start-Sleep 1