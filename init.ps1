# Script Paths
$Global:ScriptFile = $MyInvocation.MyCommand.Definition
# File to store program status between reboots
$Global:TempFolder = $Env:TEMP + "\WinDev"
$Global:TempFile = $Global:TempFolder + "\database.clixml"

# -------------------------------------
# Imports
# -------------------------------------
. $PSScriptRoot\helpers\file-managment.ps1
. $PSScriptRoot\helpers\misc.ps1
. $PSScriptRoot\helpers\functions.ps1
. $PSScriptRoot\helpers\tasks-function.ps1
. $PSScriptRoot\libraries\windows\apps.ps1
. $PSScriptRoot\libraries\windows\configs.ps1
. $PSScriptRoot\libraries\wsl\apps.ps1
. $PSScriptRoot\libraries\wsl\configs.ps1

# Retrieve Status if it was stored previusly
#$Global:Status = Read-Data -FilePath $Global:TempFile
$Status = Read-Data -FilePath $Global:TempFile

# Creating default program status if it doesnt exists already
if ($Null -eq $Status) {
    # The Tasks List must be reversed in order to be able to iterate it backwards and be modified on the fly
    $global:WindowsApps.Reverse()
    $global:WindowsConfigs.Reverse()
    $Global:WslApps.Reverse()
    $Global:WslConfigs.Reverse()
    
    # Default Values
    $Status = @{
        # This feature is not in use at the moment
        Step = "A"
        # This is the main array that organizes all the tasks to run
        TaskList = [System.Collections.ArrayList]@(
            @{
                Windows = [System.Collections.ArrayList]@(
                    @{Installing = $Global:WindowsApps},
                    @{Configuring = $Global:WindowsConfigs}
                )
            },
            @{
                Wsl = [System.Collections.ArrayList]@(
                    @{Installing = $Global:WslApps},        
                    @{Configuring = $Global:WslConfigs}
                )
            }
        )
    }
}

# Make Status available everywhere
$Global:Status = $Status

# Clear any entry in the registry
Clear-Any-Restart

# Flow stop
#Read-Host -Prompt "The program will install and configure apps, press any key to continue..."

# Create Temporary Folder if it doesn't exist
if (-not(Test-Path $Global:TempFolder)) {
    $Null = New-Item $Global:TempFolder -ItemType Directory
}

# Core Process
Start-Tasks -List $Status.TaskList

# Remove temporary data files
Clear-Data $Global:TempFolder

# Flow stop and exit
Read-Host -Prompt "The program is finished, press any key to exit..."

