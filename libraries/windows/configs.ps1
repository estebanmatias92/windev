# Settings for Windows Apps
[System.Collections.ArrayList]$global:WindowsConfigs = @(
    @{
        Name = "Pwsh Modules"
        Run = ". $($PSScriptRoot)\configs\shell-modules\pwsh.ps1"
    },
    @{
        Name = "SSH Keys"
        Run = ". $($PSScriptRoot)\configs\ssh.sh"
    },
    @{
        Name = "Github SSH Credentials"
        Run = ". $($PSScriptRoot)\configs\github-ssh-login.ps1"
    },
    @{
        Name = "Dotfiles (Powershell and Windows Terminal settings)"
        Run = ". $($PSScriptRoot)\configs\dotfiles.ps1"
    }
)