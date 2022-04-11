$global:started = $FALSE
$global:startingStep = $Global:Status.Step
# Admin Registry
#$HKEY_LOCAL_MACHINE_RUN = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
# User Registry
$HKEY_CURRENT_USER_RUN = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
# Registry path where the script will be schedule to start after boot
$global:RegRunKey = $HKEY_CURRENT_USER_RUN
# Name of the routine
$global:KeyName = "Restart-And-Resume"
# Storing powershell path
$global:powershell = (Get-Command powershell).Definition


# As seen from the test script above, we declare a script parameter $Step for taking in the starting step from the command line. We then create a simple guard method Start-Step which will return false until the starting step specified on the command line is encountered, and from there on, it will return true:
function Start-Step([string] $prospectStep) 
{
    $global:startingStep
    if ($global:startingStep -eq $prospectStep -or $global:started) {
        $global:started = $TRUE
    }
    return $global:started
}


# As much as I like the super general ???-ItemProperty functions of PowerShell, I tend to think these methods can clutter the scripts and make them less readable. Therefore I will introduce four simple helper methods for dealing with the Registry:
function Test-Key {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Position = 0)]
        [String]
        $Path,
        # Parameter help description
        [Parameter(
            Position = 1, 
            Mandatory = $True
        )]
        [String]
        $KeyName
    )

    return ((Test-Path -Path $Path) -and ($null -ne (Get-Key -Path $Path -KeyName $KeyName)))
}


function Remove-Key {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Position = 0)]
        [String]
        $Path,
        # Parameter help description
        [Parameter(
            Position = 1,
            Mandatory = $True
        )]
        [String]
        $KeyName        
    )

    Remove-ItemProperty -Path $Path -Name $keyName
}

function Set-Key {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Position = 0)]
        [String]
        $Path,
        [Parameter(Position = 1)]
        [String]
        $KeyName,
        [Parameter(Position = 2)]
        [String]
        $Value
    )

    Set-ItemProperty -Path $Path -Name $KeyName -Value $Value
}

function Get-Key {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Position = 0)]
        [String]
        $Path,
        # Parameter help description
        [Parameter(
            Position = 1, 
            Mandatory = $True
        )]
        [String]
        $KeyName
    )

    return (Get-ItemProperty $Path).$KeyName
}


# Restarting a computer from PowerShell is done simply with the command Restart-Computer. Making Windows execute a command on startup is handled via the Registry key "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run". Putting this information together leads us to define a Restart-And-Run function which will reboot and then launch whatever is passed in the $run parameter.
function Restart-And-Run {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Position = 0)]
        [String]
        $KeyName,
        # Parameter help description
        [Parameter(Position = 1)]
        [String]
        $Run
    )

    Set-Key -Path $global:RegRunKey -KeyName $KeyName -Value $Run
    Write-Host ""
    Read-Host -Prompt "The program needs to reboot, press any key to continue..." 
    Restart-Computer
    exit    
}   

# If you do not want to launch the command specified every time you start Windows, you better remember to clear that Registry key. As we plan to resume our script, we can easily do that in a dedicated function which is to be placed at the top of our script.
function Clear-Any-Restart {  
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(
            Position = 0
        )]
        [string]
        $KeyName = $global:KeyName
    )
    
    if (Test-Key -Path $global:RegRunKey -KeyName $KeyName) {
        Remove-Key -Path $global:RegRunKey -KeyName $KeyName
    }
}

# As you may have noticed, the Clear-Any-Restart function takes a default key of "Restart-And-Resume", and resuming the script was what this article set out to accomplish. Guess what, all we need to do is restart PowerShell with the wanted step parameter:
function Restart-And-Resume {
    [CmdletBinding()]
    param (        
        # Parameter help description
        [Parameter(Mandatory = $True)]
        [hashtable]
        $Status
    )

    if ($Null -ne $Status) {
        Save-Data -FilePath $Global:TempFile -Data $Status
    } 

    Restart-And-Run -KeyName $global:KeyName -Run "$global:powershell $Global:ScriptFile"
}