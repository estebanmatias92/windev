# Setting up the Configuration directory path from within linux (is getting it from the linux filesystem)
$ConfigDir = invoke-expression "($($global:wsl) --cd $($PSScriptRoot) bash -c pwd)+'/config'"

# Settings for Linux Apps
[System.Collections.ArrayList]$global:WslConfigs = @(
    @{
        Name = "Zsh Modules"
        Run = "$($global:wsl) bash -c '$($ConfigDir)/shell-modules/zsh.sh'"
    },
    @{
        Name = "SSH Keys"
        Run = "$($global:wsl) bash -c '$($ConfigDir)/ssh.sh'"
    },
    @{
        Name = "Github SSH Credentials"
        Run = "$($global:wsl) bash -c '$($ConfigDir)/github-ssh-login.sh'"
    },
    @{
        Name = "Dotfiles"
        Run = "$($global:wsl) bash -c '$($ConfigDir)/dotfiles.sh'"
    }
)