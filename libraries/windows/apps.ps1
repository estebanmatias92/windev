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
        Name = "$($LinuxDistro.Title)"
        Run = "Start-Process 'powershell.exe' -Wait -Verb runAs -ArgumentList '-Command wsl --install -d $($LinuxDistro.Name)'"
        Restart = $True
    },
    @{
        # Wait the user to configure WSL Machine
	    Name = "$($LinuxDistro.Title) (settings)"
        Run = "Write-Host 'Waiting for the linux machine to be configured...'; Wait-Until $($LinuxDistro.Exe); Write-Host 'Successfully installed and configured'"
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