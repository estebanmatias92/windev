# Apps for Windows 
[System.Collections.ArrayList]$global:WindowsApps = @(    
    @{
        Name = "Visual Studio Code"
        Run = "winget install -i -e --id Microsoft.VisualStudioCode"
    },
    @{
        Name = "Git"
        Run = "winget install -i -e --id Git.Git"
        Restart = $True
    },
    @{
        Name = "Github CLI"
        Run = "winget install -i -e --id GitHub.cli"
    },
    @{
        Name = "Github Desktop"
        Run = "winget install -i -e --id GitHub.GitHubDesktop"
    },
    @{
        Name = "Installing Ubuntu 20.04 (WSL2)"
        Run = "Start-Process 'powershell.exe' -Wait -Verb runAs -ArgumentList '-Command wsl --install -d Ubuntu-20.04'"
        Restart = $True
    },
    @{
        Name = "PowerShell"
        Run = "winget install -i -e --id Microsoft.PowerShell"
    },
    @{
        Name = "Windows Terminal Preview"
        Run = "winget install -i -e --id Microsoft.WindowsTerminal.Preview"
    },
    @{
        Name = "Docker Desktop"
        Run = "winget install -i -e --id Docker.DockerDesktop"
        Restart = $True
    }
)

