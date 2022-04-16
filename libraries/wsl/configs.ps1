SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

$ConfigDir = "/libraries/wsl/config"

# Settings for Linux Apps
[System.Collections.ArrayList]$global:WslConfigs = @(
    @{
        Name = "Zsh Modules"
        Run = "$($global:wsl) bash -c '`$(SCRIPT_DIR)$($ConfigDir)/shell-modules/zsh.sh'"
    },
    @{
        Name = "SSH Keys"
        Run = "$($global:wsl) bash -c '`$(pwd)$($ConfigDir)/ssh.sh'"
    },
    @{
        Name = "Github SSH Credentials"
        Run = "$($global:wsl) bash -c '`$(pwd)$($ConfigDir)/github-ssh-login.sh'"
    },
    @{
        Name = "Dotfiles"
        Run = "$($global:wsl) bash -c '`$(pwd)$($ConfigDir)/dotfiles.sh'"
    }
)