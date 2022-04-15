# Handy Helper to avoid repeated work
function Install-PwshModule {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $True,
            Position = 0           
            )]
        [String]
        $Name,
        # Parameter help description
        [Parameter(
            Position = 1,
            ValueFromRemainingArguments = $True
            )]
        $Arguments        
    )

    # If arguments were passed, then loop through them
    if ($Arguments) {
        # Trying to find the version flag and the version number required to install, once it's found, both values are store to use them with install-module()
        foreach ($Tag in @("-RequiredVersion", "-MinimumVersion", "-MaximumVersion")) {
            $i = $Arguments.tolower().IndexOf($Tag.ToLower())
            # If the "version" flag is founded, then look for that especific module version
            if ($i -ge 0) {
                $Version = $Arguments[$i+1]
                $FullyQualifedName = @{ModuleName = $Name; ModuleVersion = $Version}
                $Module = Get-Module -FullyQualifiedName $FullyQualifedName
                break
            }
        }
    } else {
        # If no arguments were given, try to find the module with the name only
        $Module = Get-Module -Name $Name -ListAvailable
    }

    Write-Subtitle "Installing $($Name)."

    # If the module was installed, just give a message, if not, proceed to install it
    if ($Module) {
        Write-Host "$($Module.Name) $($Module.Version) already installed."
    } else {
        $Module = Invoke-Expression "Install-Module $($Name) $([string]$Arguments) -PassThru -Force -AllowClobber -AcceptLicense"
        Write-Host "$($Module.Name) $($Module.Version) is now installed."
    }

    Write-Host ""
}

# Tab completition and command history
Install-PwshModule PSReadLine -MinimumVersion 2.2.2

# Adds status and auto-completion
Install-PwshModule posh-git 
$env:POSH_GIT_ENABLED = $true

# PowerShell module that provides utilities for working with SSH connections within PowerShell.
Install-PwshModule posh-sshell

# Better SSH session managment
Install-PwshModule Posh-SSH 

# Install prompt theme engine and make it available for any shell
Install-PwshModule oh-my-posh 
$env:POSH_PATH

# A PowerShell module to show file and folder icons in the terminal.
Install-PwshModule Terminal-Icons

# This little tool lets you jump directly to your frequently used directories in PowerShell.
Install-PwshModule z

# Update all modules
Write-Subtitle "Updating all modules."

Update-Module
Get-InstalledModule

Write-Host ""
Write-Host "The modules are up to date."
Start-Sleep 1