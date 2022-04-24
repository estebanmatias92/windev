$RootDir = (get-item $PSScriptRoot).parent.parent.parent.FullName
# -------------------------------------
# Imports
# -------------------------------------
. $RootDir\helpers\misc.ps1


# Creating SSH Keys
Write-Subtitle "Creating SSH keys"
$email = Read-Host "Enter your github user.email"
ssh-keygen -t ed25519 -C $email
Write-Host "SSH key pair was created."
Write-Host ""
Start-Sleep 1


# Start the ssh-agent service/deamon
Write-Subtitle "Starting SSH-AGEN"
# But First set SSH Service to start everytime the SSH-AGENT is called
Start-Process 'powershell.exe' -Wait -Verb runAs -ArgumentList '-Command Get-Service -Name ssh-agent | Set-Service -StartupType Manual'
# Then Run the Agent
ssh-agent
Write-Host "The ssh-agent is running." 
Get-Service ssh-agent
Write-Host ""
Start-Sleep 1


# Add the SSH private key to the ssh-agent
Write-Subtitle "Adding the private key to the ssh-agent"
ssh-add "$($HOME)\.ssh\id_ed25519"
Write-Host "SSH Key added to the agent."
Write-Host ""
Start-Sleep 3