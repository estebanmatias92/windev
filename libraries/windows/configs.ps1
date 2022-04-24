$ConfigDir = "$($PSScriptRoot)\config"

# Settings for Windows Apps
[System.Collections.ArrayList]$global:WindowsConfigs = @(
    @{
        Name = "Fonts"
        Run = "pwsh -c $($ConfigDir)\fonts.ps1"
    },
    @{
        Name = "Pwsh Modules"
        Run = "pwsh -c $($ConfigDir)\shell-modules\pwsh.ps1"
    },
    @{
        Name = "SSH Keys"
        Run = "pwsh -c $($ConfigDir)\ssh.ps1"
    },
    @{
        Name = "Github SSH Credentials"
        Run = "pwsh -c $($ConfigDir)\github-ssh-login.ps1"
    },
    @{
        Name = "Dotfiles (Powershell and Windows Terminal settings)"
        Run = "pwsh -c $($ConfigDir)\dotfiles.ps1"
    }
)