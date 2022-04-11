# Config Folder Path
$ConfigDir = "$($PSScriptRoot)\config"

# Settings for Windows Apps
[System.Collections.ArrayList]$global:WindowsConfigs = @(
    @{
        Name = "Pwsh Modules"
        Run = ". $($ConfigDir)\shell-modules\pwsh.ps1"
    },
    @{
        Name = "SSH Keys"
        Run = ". $($ConfigDir)\ssh.ps1"
    },
    @{
        Name = "Github SSH Credentials"
        Run = ". $($ConfigDir)\github-ssh-login.ps1"
    },
    @{
        Name = "Dotfiles (Powershell and Windows Terminal settings)"
        Run = ". $($ConfigDir)\dotfiles.ps1"
    }
)