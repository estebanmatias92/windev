# Config Folder Path
$ConfigDir = "$($PSScriptRoot)\config"

# Settings for Linux Apps
[System.Collections.ArrayList]$global:WslConfigs = @(
    @{
        Name = "Zsh Modules"
        Run = "$($global:wsl) '. $($ConfigDir)\shell-modules\zsh.sh'"
    },
    @{
        Name = "SSH Keys"
        Run = "$($global:wsl) '. $($ConfigDir)\ssh.sh'"
    },
    @{
        Name = "Github SSH Credentials"
        Run = "$($global:wsl) '. $($ConfigDir)\github-ssh-login.sh'"
    },
    @{
        Name = "Dotfiles"
        Run = "$($global:wsl) '. $($ConfigDir)\dotfiles.sh'"
    }
)