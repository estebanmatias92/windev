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