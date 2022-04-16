# Function to Clone Objects
function Copy-Object {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(
            Mandatory = $True,
            Position = 0
        )]
        $Object       
    )
    
    if ($Null -ne $Object) {
        # I Create a temporary variable to modify while the original is used as inmutable data to loop through
        # Serialize and Deserialize data using BinaryFormatter
        $ms = New-Object System.IO.MemoryStream
        $bf = New-Object System.Runtime.Serialization.Formatters.Binary.BinaryFormatter
        $bf.Serialize($ms, $Object)
        $ms.Position = 0
        #Deep copied data
        $Cloned = $bf.Deserialize($ms)
        $ms.Close()
        
        return $Cloned
    } else {
        return $Null
    }
}


# Process Animation
function Wait-Animation {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(
            Mandatory = $True,
            Position = 0
            )]
        $Script,
        [Parameter(
            Mandatory = $False, 
            Position = 1
            )]
        [int]
        $Speed = 200
    )

    $Global:AnimationSpeed = $Speed

    $scroll = "/-\|/-\|"
    $idx = 0
    $job = Start-Job -ArgumentList $Script  -ScriptBlock {
        param (
            [parameter(Mandatory=$true)][string]$ScriptBlock
        )
    
        & ([scriptblock]::Create($ScriptBlock))    
    }

    $origpos = $host.UI.RawUI.CursorPosition
    $origpos.Y += 1
    
    while (($job.JobStateInfo.State -eq "Running") -and ($job.JobStateInfo.State -ne "NotStarted"))
    {
        $host.UI.RawUI.CursorPosition = $origpos
        Write-Host $scroll[$idx] -NoNewline
        $idx++
        if ($idx -ge $scroll.Length)
        {
            $idx = 0
        }
        Start-Sleep -Milliseconds $Speed
    }

    # It's over - clear the activity indicator.
    $host.UI.RawUI.CursorPosition = $origpos
}

# Stop flow until the process is done
function Wait-Until {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(
            Mandatory = $True, 
            Position = 0
            )]
        $Process
    )

    Wait-Animation "
        While(-not(Get-Process $Process -ErrorAction SilentlyContinue)){
            
            Start-Sleep -Milliseconds $Global:AnimationSpeed
        } 
        if(Get-Process $Process -ErrorAction SilentlyContinue) {
            do {
                Start-Sleep -Milliseconds $Global:AnimationSpeed
            } until (-not(Get-Process $Process -ErrorAction SilentlyContinue))
        }"   
}

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

# Write-Host Spam
function Write-Title {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(
            Mandatory = $True, 
            Position = 0
        )]
        [string]
        $String
    )

    Write-Host ""
    Write-Host " |===|"
    Write-Host " |   |  $($String)"
    Write-Host " |===|"
    Write-Host ""
}


# Write-Host Spam
function Write-Subtitle {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(
            Mandatory = $True, 
            Position = 0
        )]
        [string]
        $String
    )


    Write-Host "        "
    Write-Host "       |=|  $($String)"
    Write-Host "        "

}