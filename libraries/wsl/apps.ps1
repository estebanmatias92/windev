# Linux shell on command
$global:wsl = "wsl -d ubuntu-20.04"

# Apps to install through WSL
[System.Collections.ArrayList]$global:wslApps = @(   
    @{
        Name = "Updates"
        Run = "$($global:wsl) 'yes | sudo apt update && yes | sudo apt upgrade'"
    },   
    [PSCustomObject]@{
        Name = "Curl"
        Run = "$($global:wsl) 'sudo apt install curl'"
    },
    @{
        Name = "Git"
        Run = "$($global:wsl) 'sudo apt install git'"
    },    
    @{
        Name = "Github CLI"
        Run = "$($global:wsl) `"curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && echo 'deb [arch=`$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main' | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && yes | sudo apt update && sudo apt install gh`""
    }, 
    @{
        Name = "Visual Studio Code (Server)"
        Run = "$($global:wsl) 'code ~/.zshrc'"
    }
)