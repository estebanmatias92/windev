# Settings for Linux Apps
[System.Collections.ArrayList]$global:WslConfigs = @(
    @{
        Name = "Zsh Modules"
        Run = "$($global:wsl) '. $($PSScriptRoot)\configs\shell-modules\zsh.sh'"
    },
    @{
        Name = "SSH Keys"
        Run = "$($global:wsl) '. $($PSScriptRoot)\configs\ssh.sh'"
    },
    @{
        Name = "Github SSH Credentials"
        Run = "$($global:wsl) '. $($PSScriptRoot)\configs\github-ssh-login.sh'"
    },
    @{
        Name = "Dotfiles"
        Run = "$($global:wsl) '. $($PSScriptRoot)\configs\dotfiles.sh'"
    }
)