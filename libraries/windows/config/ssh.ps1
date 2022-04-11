# Creating SSH Keys
Write-Host "-------------------------"
Write-Host "--- Creating SSH keys ---"
Write-Host "-------------------------"
Write-Host ""
$mygituseremail = Read-Host "Enter your github user.email"
ssh-keygen -t ed25519 -C $mygituseremail
Write-Host ""
Write-Host "SSH key pair was created."
Start-Sleep 2


# Start the ssh-agent service/deamon
Write-Host ""
Write-Host "--------------------------"
Write-Host "--- Starting SSH-AGENT ---"
Write-Host "--------------------------"
Write-Host ""
ssh-agent
Write-Host "The ssh-agent is running." 
Get-Service ssh-agent
Start-Sleep 3


# Add the SSH private key to the ssh-agent
Write-Host ""
Write-Host "-----------------------------------------------"
Write-Host "--- Adding the private key to the ssh-agent ---"
Write-Host "-----------------------------------------------"
Write-Host ""
ssh-add ~\.ssh\id_ed25519
Write-Host "SSH Key added to the agent."
Start-Sleep 2