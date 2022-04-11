function Clear-Data {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory = $True)]
        [String]
        $FilePath
    )
    
    if (Test-Path $FilePath) {
        Remove-Item -Path $FilePath -Force
    } 
}


function Save-Data {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory = $True)]
        [String]
        $FilePath,
        # Parameter help description
        [Parameter(Mandatory = $True)]
        [hashtable]
        $Data
    )

    $Data | Export-Clixml -Depth 10 $FilePath
}


function Read-Data {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory = $True)]
        [String]
        $FilePath
    )

    if (Test-Path $FilePath) {
        return Import-Clixml $FilePath
    } else {
        return $Null
    }
}


function Update-Data {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory = $True)]
        [String]
        $FilePath,
        # Parameter help description
        [Parameter(Mandatory = $True)]
        [hashtable]
        $Data
    )

    Clear-Data -FilePath $FilePath
    Save-Data -FilePath $FilePath -Data $Data
}