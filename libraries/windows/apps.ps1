# Wsl Distro
[hashtable]$LinuxDistro = @{
    Title = "Ubuntu 20.04 (WSL2)"
    Name = "Ubuntu-20.04"
    Exe = "ubuntu2004"
}

# Apps for Windows 
[System.Collections.ArrayList]$global:WindowsApps = @(    
    @{
        Name = "Visual Studio Code"
        Run = "winget install -i -e --id Microsoft.VisualStudioCode --accept-source-agreements --accept-package-agreements"
    },
    @{
        Name = "Git"
        Run = "winget install -i -e --id Git.Git --accept-source-agreements --accept-package-agreements"
        Restart = $True
    },
    @{
        Name = "Github CLI"
        Run = "winget install -i -e --id GitHub.cli --accept-source-agreements --accept-package-agreements"
    },
    @{
        Name = "Github Desktop"
        Run = "winget install -i -e --id GitHub.GitHubDesktop --accept-source-agreements --accept-package-agreements"
    },
    @{
        Name = "$($LinuxDistro.Title)"
        Run = "Start-Process 'powershell.exe' -Wait -Verb runAs -ArgumentList '-Command wsl --install -d $($LinuxDistro.Name)'"
        Restart = $True
    },
    @{
        # Wait the user to configure WSL Machine
	    Name = "$($LinuxDistro.Title) (settings)"
        Run = "Write-Host 'Waiting for the linux machine to be configured...'; Wait-Until $($LinuxDistro.Exe); Write-Host 'Successfully installed and configured.'"
    },
    @{
        Name = "PowerShell"
        Run = "winget install -i -e --id Microsoft.PowerShell --accept-source-agreements --accept-package-agreements"
    },
    @{
        Name = "Windows Terminal Preview"
        Run = "winget install -i -e --id Microsoft.WindowsTerminal.Preview --accept-source-agreements --accept-package-agreements"
    },
    @{
        Name = "Docker Desktop"
        Run = "winget install -i -e --id Docker.DockerDesktop --accept-source-agreements --accept-package-agreements"
        Restart = $True
    }
)