# Settings for Linux Apps
[System.Collections.ArrayList]$global:WslConfigs = @(
    @{
        Name = "Zsh Modules"
        Run = "$($global:wsl) bash -c config/shell-modules/zsh.sh"
    },
    @{
        Name = "SSH Keys"
        Run = "$($global:wsl) bash -c config/ssh.sh"
    },
    @{
        Name = "Github SSH Credentials"
        Run = "$($global:wsl) bash -c config/github-ssh-login.sh"
    },
    @{
        Name = "Dotfiles"
        Run = "$($global:wsl) bash -c config/dotfiles.sh"
    }
)